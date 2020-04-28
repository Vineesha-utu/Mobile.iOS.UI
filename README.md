<h1 align="center">TaxFree iOS UI Components</h1>

<p align="center">
  
</p>
<p align="center">
  
  <a href="https://cocoapods.org" > <img src="https://raw.githubusercontent.com/CocoaPods/shared_resources/master/assets/cocoapods-banner-readme.png" width=250 height=30/></a>

A component library that can use the custom views for all Tax Free related applications
</p>

## What this framework contains

1. Custom Tax-free Text Field.
2. Custom AlertView.
3. Custom SnackBar (from Material components).
4. Custom ActionSheet.

## How to integrate into your app?

Step 1 : Generate a Podfile and add the following line,

    pod "UTUFramework", :git => 'https://github.com/UTU-Global/Mobile.iOS.UI', :branch => 'common_pod'

Note : As the pod already uses MaterialComponents and SDWebImage pods. Please comment the those line if already using in  your Podfile.



Step 2 : import UTUFramework where ever you are using the components

    import UTUFramework

Step 3 : Add the header file in bridge-header.h (This is required step, to make our custom ActionSheet work)

    #import "CustomModalPresentViewController.h"


## 1. Adding Custom TextField 

In XIB or StoryBoard , drag and drop the UITextField as usual. But need to change the class as "SkyFloatingLabelTextField" and the module to UTUFramework as below

<img src= "https://user-images.githubusercontent.com/62499361/80496873-623d5b80-8987-11ea-9a20-4521d630c615.png" width="250" height="150" />


In the respective ViewController

The below line are for non secreted(plain text)

```
        self.emailtxtfld.placeholder = "Email"
        self.emailtxtfld.delegate = self
        self.emailtxtfld.autocorrectionType = .no
        self.emailtxtfld.tag = 100
        self.emailtxtfld.keyboardType = UIKeyboardType.emailAddress
        self.emailtxtfld.font = UIFont(name : "NotoSans", size: 16)

```


For the password or secreted text fields need to add couple of line (by default "isPasswordViewEnable" is false so that the cancel button is visible)

```
        self.passwordTxtfld.isPasswordViewEnable = true
        self.passwordTxtfld.isSecureTextEntry = true

```

## Adding Custom AlertView




