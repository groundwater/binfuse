## Quick Start

**Note** You _must_ have the AWS [auto scaling][3] and [ec2][4] command line tools installed.

```
$ binfuse-instance-create 
i-a8d5bd9a

$ binfuse-instance-install i-a8d5bd9a
[INFO] Waiting for Instance to be Ready
[INFO] Instance Ready - Waiting for Boot
[INFO] Logging Installation in File: out.log
[INFO] Installing System Packages 
  √ System Installed
[INFO] Installing Application 
  √ Application Installed

$ binfuse-instance-package web i-a8d5bd9a
ami-843cb6b4

$ binfuse-group-deploy web ami-843cb6b4
web@130220-2217329

$ binfuse-connect 
INSTANCE  i-ce2f44fc  web@130220-2217329  us-west-2b  InService  HEALTHY  web@130220-2217329

$ binfuse-connect i-ce2f44fc
```

## Notes

- [Instance Metadata][1]
- [Modifying Instance Data][2]

[1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html
[2]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html
[3]: http://aws.amazon.com/developertools/2535
[4]: http://aws.amazon.com/developertools/368
