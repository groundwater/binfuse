## Boot Method

1. AMI is created w/o environment parameters
2. during instance creation, dynamically set `user-data` to a base64 encoded environment configuration
3. post-boot, the image extracts `user-data` to boot application with its environment configuration
4. the application is auto-started with correct environment

## Notes

- [Instance Metadata][1]
- [Modifying Instance Data][2]

[1]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html
[2]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html
