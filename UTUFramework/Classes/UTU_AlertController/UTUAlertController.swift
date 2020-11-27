//
//  UTUAlertControllerViewController.swift
//  UTUTaxFree
//
//  Created by Lakshmana Swamy on 11/15/19.
//  Copyright © 2019 utu. All rights reserved.
//

import UIKit

public protocol UTUAlertViewDelegate: class {
    func okButtonTapped()
    func cancelButtonTapped()
}
public class UTUAlertController: UIViewController {
    @IBOutlet weak var messageToTop: NSLayoutConstraint!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var messageHeight: NSLayoutConstraint!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertViewHeight: NSLayoutConstraint!
    public var tintColor = UIColor(red: 0/255, green: 179/255, blue: 152/255, alpha: 1)
    public var delegate: UTUAlertViewDelegate?
    public var titleStr : String?
    public var titleTextColor : UIColor?
    public var messageTextColor : UIColor?

    public var okBtnTitleColor : UIColor?
    public var cancelBtnTitleColor : UIColor?
    public var okBtnBgColor : UIColor?
    public var cancelBtnBgColor : UIColor?
    public var borderColor : UIColor?

    public var messageStr : String?
    public var okStr : String?
    public var cancelStr : String?
    public var isOkButtonHidden : Bool?
    public var isCancelButtonHidden : Bool?
    public var descHeight = 85
    public var titleFont : UIFont?
    let alertViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)

    override public func viewDidLoad() {
        super.viewDidLoad()
        okBtn.layer.cornerRadius = 3.0
        okBtn.layer.borderWidth = 1.0
        okBtn.layer.borderColor = UIColor(red:213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        cancelBtn.layer.cornerRadius = 3.0
        cancelBtn.layer.borderWidth = 1.0
        cancelBtn.layer.borderColor = UIColor(red:213/255, green: 213/255, blue: 213/255, alpha: 1).cgColor
        okBtn.backgroundColor = tintColor
        cancelBtn.setTitleColor(tintColor, for: .normal)
        self.alertViewHeight.constant = 184 - 61
        if let titleString = titleStr {
            if titleString.isEmpty {
                self.messageToTop.constant = 20
            }
            self.titleLbl.text = titleString
        }
        if let message = messageStr {
            self.messageLbl.text = message
            let messageHeight = heightForView(text: message, font: UIFont(name: "NotoSans", size: 14)!, width: UIScreen.main.bounds.width - 82)
            self.alertViewHeight.constant = messageHeight + 150
            self.messageHeight.constant = CGFloat(messageHeight)
        }

        if let ok = okStr {
            self.okBtn.setTitle(ok, for: .normal)
        }
        if let cancel = cancelStr {
            self.cancelBtn.setTitle(cancel, for: .normal)
        }
        if let tempTitleFont = self.titleFont {
            self.titleLbl.font = tempTitleFont
        }
        if let titleColor = self.titleTextColor {
            self.titleLbl.textColor = titleColor
        }
        if let okBgColor = self.okBtnBgColor {
            self.okBtn.backgroundColor = okBgColor
        }
        if let cancelBgColor = self.cancelBtnBgColor {
            self.cancelBtn.backgroundColor = cancelBgColor
        }
        if let okBgTitleColor = self.okBtnTitleColor {
            self.okBtn.setTitleColor(okBgTitleColor, for: .normal)
        }
        if let cancelBtnTitleColor = self.cancelBtnTitleColor {
            self.cancelBtn.setTitleColor(cancelBtnTitleColor, for: .normal)
        }
        if let tempBorderColor = self.borderColor {
            okBtn.layer.borderColor = tempBorderColor.cgColor
            cancelBtn.layer.borderColor = tempBorderColor.cgColor
        }
        if let status = isOkButtonHidden {
            okBtn.isHidden = status
        }
        if let status = isCancelButtonHidden {
            cancelBtn.isHidden = status
        }
        if let messageTextColor = self.messageTextColor {
            self.messageLbl.textColor = messageTextColor
        }
    }
    private func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
        /*cancelBtn.layer.cornerRadius = 5
        okBtn.layer.cornerRadius = 5
        cancelBtn.layer.borderColor = tintColor.cgColor
        okBtn.layer.borderColor = tintColor.cgColor*/
        if #available(iOS 11.0, *) {
            cancelBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
            okBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        }
    }
    func setupView() {
        alertView.layer.cornerRadius = 5
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    func animateView() {
        alertView.alpha = 0;
        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.alertView.alpha = 1
            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
        })
    }
    
    @IBAction func onTapCancelButton(_ sender: UIButton) {
        okBtn.backgroundColor = .white
        okBtn.layer.borderColor = tintColor.cgColor
        okBtn.setTitleColor(tintColor, for: .normal)
        sender.backgroundColor = tintColor
        sender.setTitleColor(.white, for: .normal)
        delegate?.cancelButtonTapped()
       // self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapOkButton(_ sender: UIButton) {
        cancelBtn.backgroundColor = .white
        cancelBtn.layer.borderColor = tintColor.cgColor
        cancelBtn.setTitleColor(tintColor, for: .normal)
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = tintColor
        delegate?.okButtonTapped()
        //self.dismiss(animated: true, completion: nil)
    }
 
}
