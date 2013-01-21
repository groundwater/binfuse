# System Updates
sudo apt-get install    -y python-software-properties
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update     -y
sudo apt-get upgrade    -y
sudo apt-get install    -y nodejs npm nodejs-dev git make

BUNDLE=/home/ubuntu/bundle
GIT=${BUNDLE}/.git
DEPLOY=${BUNDLE}/.deploy
MASTER=${BUNDLE}/master

# Setup Application Environment
mkdir -p ${GIT}
mkdir -p ${DEPLOY}

# Initialize Git Hooks
(cd ${GIT} && git init --bare)
cat > ${GIT}/hooks/post-receive <<EOF
cd ${GIT}
HEAD=\`cat ${GIT}/refs/heads/master\`
NEXT=${DEPLOY}/\${HEAD}
mkdir -p \${NEXT}
git archive master | tar -x -C \${NEXT}
ln -snf \${NEXT} ${MASTER}
(cd ${MASTER} && sudo make install)
NOW=\`date\`
echo "\${NOW} Deployed \${HEAD}" >> bundle.log
EOF

chmod a+x ${GIT}/hooks/post-receive

# Install Application Container
sudo npm install -g git+https://github.com/jacobgroundwater/node-general.git#master
sudo mkdir -p /var/log/general
sudo chown ubuntu:ubuntu /var/log/general

ng upstart | sudo tee /etc/init/general.conf

