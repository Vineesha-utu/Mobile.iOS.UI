//
//  SnackBar.swift
//  SampleAlert
//
//  Created by Madhu on 28/04/20.
//  Copyright © 2020 Madhu. All rights reserved.
//

import UIKit
import MaterialComponents

public class UTUSnackBar : NSObject, MDCSnackbarManagerDelegate {
    private var snackbarTitle = ""
    private var isSuccess = false
    private var customMessageView : UIView!
    private var moreButton, statusButton : UIButton!
    private let messageAction = MDCSnackbarMessageAction()
    private let snackbarMessage = MDCSnackbarMessage()
    private var snackbarTitleLblHeight : CGFloat!
    private var defaultManager : MDCSnackbarManager!
    private var snackbarTitleLbl : UILabel!
    
    //Singleton Implementation
    static public let sharedInstance:UTUSnackBar = {
        let instance = UTUSnackBar ()
        return instance
    } ()
    
    public func showSnackbar(title: String){
        self.showSnackbar(title: title, forSuccess: false)
    }
    
    public func showSnackbar(title: String, forSuccess : Bool){
        let actionHandler = {() in
            MDCSnackbarManager.dismissAndCallCompletionBlocks(withCategory: "infinite")
        }
        messageAction.handler = actionHandler
        snackbarMessage.action = messageAction
        snackbarTitle = title//"Wrong username or password, please check the credentials.Wrong username or password, please check the credentials.Wrong username or password, please check the credentials.Wrong username or password, please check the credentials."
        isSuccess = forSuccess
        defaultManager = MDCSnackbarManager()
        defaultManager.messageElevation = .none
        defaultManager.snackbarMessageViewShadowColor = .none
        defaultManager.snackbarMessageViewBackgroundColor = .lightGray
        defaultManager.messageTextColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
        defaultManager.alignment = .center
        defaultManager.delegate = self
        if self.hasNotch() {
            defaultManager.setBottomOffset(UIScreen.main.bounds.height - 100)
        }else{
            defaultManager.setBottomOffset(UIScreen.main.bounds.height - 85)
        }
        defaultManager.alignment = .center
        defaultManager.shouldApplyStyleChangesToVisibleSnackbars = true
        defaultManager.messageTextColor = .black
        defaultManager.show(snackbarMessage)
        
        //
        let font = UIFont(name: UTUFontNames.NotoSansRegular, size: 11)!
        snackbarTitleLblHeight = self.heightForView1(text: title, font: font, width: UIScreen.main.bounds.size.width - 96)
    }
    
    func heightForView1(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    public func willPresentSnackbar(with messageView: MDCSnackbarMessageView?) {
        customMessageView = UIView(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 16, height: 48))
        customMessageView.layer.cornerRadius = 4.0
        customMessageView.layer.borderWidth = 1
        customMessageView.layer.borderColor = UTUColors.white213.cgColor
        customMessageView.backgroundColor = UTUColors.white245
        statusButton = UIButton(frame: CGRect(x: 8, y: 11, width: 24, height: 25))
        let checkCircleImg = UIImage(named: "check_circle.png", in: Bundle(identifier: "com.utu.utuframework"), compatibleWith: nil)
        let infoImg = UIImage(named: "info.pdf", in: Bundle(identifier: "com.utu.utuframework"), compatibleWith: nil)
        if self.isSuccess {
            statusButton.setBackgroundImage(checkCircleImg, for: .normal)
        }else{
            statusButton.setBackgroundImage(infoImg, for: .normal)
        }
        customMessageView.addSubview(statusButton)

        snackbarTitleLbl = UILabel(frame: CGRect(x: 40, y: 10, width: customMessageView.bounds.size.width - 40 - 10, height: 28))
        snackbarTitleLbl.text = self.snackbarTitle
        snackbarTitleLbl.textAlignment = NSTextAlignment.left
        snackbarTitleLbl.numberOfLines = 1
        snackbarTitleLbl.textColor = .black//UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        snackbarTitleLbl.font = UIFont(name: UTUFontNames.NotoSansRegular, size: 12)
        customMessageView.addSubview(snackbarTitleLbl)
        //TapGesture
        let tapGesture = UITapGestureRecognizer()//target: self, action: #selector(moreAction)
        customMessageView.isUserInteractionEnabled = true
        tapGesture.numberOfTapsRequired = 1
        customMessageView.addGestureRecognizer(tapGesture)
        print(self.snackbarTitleLblHeight!)
        if self.snackbarTitleLblHeight <= 15.0 {
            self.snackbarMessage.duration = 3.0
            customMessageView.isUserInteractionEnabled = false
            tapGesture.addTarget(self, action: #selector(closeAction))
        }else{
            self.snackbarMessage.duration = 10.0
            tapGesture.addTarget(self, action: #selector(moreAction))
        }
        customMessageView.isUserInteractionEnabled = true
        messageView?.addSubview(customMessageView)
    }
    
    private func hasNotch() -> Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
    @objc func moreAction(){
        self.snackbarMessage.duration = 10.0
        if self.hasNotch() {
            self.defaultManager.setBottomOffset(UIScreen.main.bounds.height - 110)
        }else{
            self.defaultManager.setBottomOffset(UIScreen.main.bounds.height - 100)
        }
        let count = self.snackbarTitleLblHeight/15
        if count > 4 {
            self.defaultManager.buttonFont = UIFont(name: UTUFontNames.NotoSansRegular, size: 45)
            customMessageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 16, height:self.snackbarTitleLblHeight < 48 ? 48 : self.snackbarTitleLblHeight + 10 )
        }else if count == 3 {
            self.defaultManager.buttonFont = UIFont(name: UTUFontNames.NotoSansRegular, size: 30)
            customMessageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 16, height:75)
        }else{
            self.defaultManager.buttonFont = UIFont(name: UTUFontNames.NotoSansRegular, size: 23)
            customMessageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 16, height:58)
        }
        moreButton = UIButton(frame: CGRect(x: customMessageView.frame.width - 30, y: (customMessageView.frame.height/2) - 12, width: 24, height: 25))
        moreButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        
        let closeImage = UIImage(named: "cancel-24px.png", in: Bundle(identifier: "com.utu.utuframework"), compatibleWith: nil)
        moreButton.setImage(closeImage, for: .normal)
        moreButton.isUserInteractionEnabled = false
        customMessageView.addSubview(moreButton)
        
        snackbarTitleLbl.frame = CGRect(x: 40, y: 5, width: customMessageView.bounds.size.width - 40 - 40, height:customMessageView.frame.height - 10)
        statusButton.frame = CGRect(x: 8, y: (customMessageView.frame.height/2) - 12, width: 24, height: 25)
        snackbarTitleLbl.numberOfLines = 4
        customMessageView.isUserInteractionEnabled = false
    }
    @objc func closeAction(){
        DispatchQueue.main.async {
            self.customMessageView.isUserInteractionEnabled = false
            MDCSnackbarManager.dismissAndCallCompletionBlocks(withCategory: "infinite")
        }
    }
}
