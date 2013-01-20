## Overview

**Commands**

    binfuse-create         <-- create an AMI from current project
    binfuse-deploy         <-- deploy an AMI to an auto-scaling group

**Example**

    $ binfuse-create
    ami-a93db3e
    $ binfuse-deploy ami-a93db3e test

## Usage

### Image Creation

    Usage: 
        binfuse-create [options]
    
    Options:
               --ami, -A <s>:   Base AMI (default: ami-7e2da54e)
            --region, -r <s>:   EC2 Region (default: us-west-2)
           --keypair, -k <s>:   Key Pair Name (default: default)
    
    Default values can be specified in a `fusion.json` file, e.g.
    
        {
            "ami": "ami-7539b41c",
            "region": "us-east-1",
            "keypair": "master"
        }

### Image Deployment

    Deploy an pre-created image, in the form of an AMI, 
    to a new auto-scaling group. The booted group will
    be attached to a new or existing load-balancer.
    
    Usage: 
        binfuse-deploy [options] <AMI-ID> <Name>
    
    Options:
        --environment, -E <s>:   Environment File
              --itype, -i <s>:   Instance Type (default: m1.small)
             --region, -r <s>:   EC2 Region (default: us-west-2)
                --min, -m <i>:   Minimum Instance (default: 3)
                --max, -M <i>:   Maximum Instance (default: 3)
              --zones, -Z <s>:   Availability Zones (default: us-west-2a,us-west-2b,us-west-2c)
             --subets, -s <s>:   Subnet VPC Zones
    
     The flag --subnets overrides --zones
     
     Default values can be specified in a `fusion.json` file, and deployment 
     specific values can be specified in a `fusion-<Name>.json` file.
    
         {
             "environment": ".env.production",
             "region": "us-east-1",
             "subnets": "subnet-07049e6e,subnet-e4039a8d,subnet-abd483c2",
             "min": 3,
             "max": 9,
             "itype": "m1.large"
         }
     

## Application Bundle

An application bundle only requires two components

1. a `Procfile`
2. a `Taskfile`

The [Procfile][3] is a fairly common format.
The `Taskfile` is similar, it is designed for tasks related to the application.

    deploy: make deploy
    clean: make clean

The actual file is just an interface to whatever build system you prefer.
You can run `make`, `rake`, `cake`, or abominations such as `ant`.
If no key exists in the `Taskfile` it is assumed the task does not need to be run.

During install, tasks will be called in the following order:

1. install
2. bundle
3. deploy

## Notes

- [Instance Metadata][1]
- [Modifying Instance Data][2]

[1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html
[2]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html
[3]: http://ddollar.github.com/foreman/#PROCFILE






