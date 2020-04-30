<h1 align="center">Tax free iOS UI Components</h1>

<p align="center">
  
</p>
<p align="center">
  
  <a href="https://cocoapods.org" > <img src="https://raw.githubusercontent.com/CocoaPods/shared_resources/master/assets/cocoapods-banner-readme.png" width=250 height=30/></a>

Custom components library for all Tax free applications.
</p>

## What this framework contains

1. Custom Text Field.
2. Custom AlertView.
3. Custom SnackBar (from Material components).
4. Custom ActionSheet.

## How to integrate into your app?

Step 1 : Generate a Podfile and add the following line,

    pod "UTUFramework", :git => 'https://github.com/UTU-Global/Mobile.iOS.UI', :branch => 'common_pod'

Note : As the pod already uses MaterialComponents pods. Please comment the those line if already using in  your Podfile.



Step 2 : import UTUFramework where ever you are using the components

    import UTUFramework

Step 3 : Add the header file in bridge-header.h (This is required step, to make our custom ActionSheet work)

    #import "CustomModalPresentViewController.h"


## 1. Adding Custom TextField 

In XIB or StoryBoard , drag and drop the UITextField as usual. But need to change the class as "SkyFloatingLabelTextField" and the module to "UTUFramework" as below

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

## 2. Adding Custom AlertView

As usual import UTUFramework, the following sample function UTUAlertView.

The Viewcontroller should conform to protocol UTUAlertViewDelegate.

```
class ViewController : UIViewController,UTUAlertViewDelegate {
              .
              .
              .

func showAlert(){
        let customAlert = UTUAlertController(nibName: "UTUAlertController", bundle: Bundle(identifier: "com.utu.utuframework"))
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        customAlert.delegate = self
        customAlert.tintColor = .red
        customAlert.titleStr =  "Are you sure you want to delete it ?"
        //customAlert.messageStr = "if you want to show the message you can use this property"
        customAlert.okStr = "OK"
        customAlert.cancelStr = "Cancel"
        self.present(customAlert, animated: true, completion: nil)
    }
    
    
              .
              .
              .
     //Alert delegate methods
    func okButtonTapped() {
        print("Ok Clicked")
    }
     //Alert delegate methods
    func cancelButtonTapped() {
        print("Canel Clicked")
    }
    
}
```
## 3. Adding Custom SnackBar

```
func showSnackBar(){
        UTUSnackBar.showSnackbar(title: "Profile has been updated successfully", forSuccess: true)
        //UTUSnackBar.showSnackbar(title: "Something went wrong. Please try again later", forSuccess: false)
        //UTUSnackBar.showSnackbar(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem     Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.,", forSuccess: true)
        //UTUSnackBar.showSnackbar(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem     Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", forSuccess: false)
    }

```

## 4. Adding Custom ActionSheet

The Viewcontroller should conforms to protocol PickerSelectionDelegate.

```
class ViewController : UIViewController,PickerSelectionDelegate {
              .
              .
              .

  func showActionSheet(){
        let vc = UTUActionSheetVC(nibName: "UTUActionSheetVC", bundle: Bundle(identifier: "com.utu.utuframework"))
        vc.items = [["title":"Take photo","image":"photoCamera"],["title":"Gallery","image":"photoLibrary"]]
        let customVC = CustomModalPresentViewController.init(rootViewController: vc)
        customVC?.partScreenPresentYPos = Float(UIScreen.main.bounds.size.height - 197)
        vc.delegateObj = self
        self.present(customVC!, animated: true, completion: nil)
    }
    
    
    
              .
              .
              .
    //Picker delegate method
    func getPickerValue(title:String,index:Int) {
        if index == 0 {
            print("Index 0 selected")
        }else index == 1 {
            print("Index 1 selected")
        }
        .
        .
        .
    }
    
}
              

```


