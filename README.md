# Scaffolding for Skygear iOS App

Your Skygear iOS App is one command away! This scaffolding app set up the basic
of Skygear iOS app for you, including:

* Choose between Objective-C and Swift
* Configure API endpoint
* Basic features like login / signup.

## Prerequisite

* [Xcode](https://developer.apple.com/download/)
* [CocoaPods](https://guides.cocoapods.org/using/getting-started.html)
* Sign up [Skygear.io](https://skygear.io) for the endpoint URL and API Key

## How to use

```bash
sudo gem install colored cocoapods

sudo gem install colored

pod repo update

pod lib create --silent --template-url=https://github.com/SkygearIO/skygear-Scaffolding-iOS.git "YourProjectName"
```

And it will walk you through the following:
```bash
What is your skygear endpoint (You can find it in https://portal.skygear.io/)?
Example: https://myapp.skygeario.com
> https://myapp.skygeario.com

What is your skygear API key (You can find it in https://portal.skygear.io/)?
Example: dc0903fa85924776baa77df813901efc
> <your-api-key>

What language do you want to use? [ Swift / ObjC  ]
> ObjC

What is your class prefix?
> YPN
```

You can learn more about the Skygear iOS SDK by going to https://docs.skygear.io


## Credits

Inspired from https://github.com/CocoaPods/pod-template
