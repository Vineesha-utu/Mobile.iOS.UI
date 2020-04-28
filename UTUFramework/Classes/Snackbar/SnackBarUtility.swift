//
//  SnackBar.swift
//  SampleAlert
//
//  Created by Madhu on 28/04/20.
//  Copyright © 2020 Madhu. All rights reserved.
//

import UIKit
import MaterialComponents
import SDWebImage

public class SnackBarUtility : NSObject, MDCSnackbarManagerDelegate {
    var serviceDictionary : NSDictionary?
    var snackbarTitle = ""
    var isSuccess = false
    var customMessageView : UIView!
    var moreButton, statusButton : UIButton!
    let messageAction = MDCSnackbarMessageAction()
    let snackbarMessage = MDCSnackbarMessage()

    //static var snackbarMessage : MDCSnackbarMessage! // UTUSnackbarMessage() //
    var snackbarTitleLblHeight : CGFloat!
    var defaultManager : MDCSnackbarManager!
    var snackbarTitleLbl : UILabel!
    //Singleton Implementation
    static public let sharedInstance:SnackBarUtility = {
        let instance = SnackBarUtility ()
        return instance
    } ()

    public func showSnackbar(title: String){
        self.showSnackbar(title: title, forSuccess: false)
    }
    
     func showSnackbar(title: String, forSuccess : Bool){
        //let snackbarMessage = MDCSnackbarMessage()
        //let action = MDCSnackbarMessageAction()
        
        let actionHandler = {() in
            //todo
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
        if self.isSuccess {
            statusButton.setBackgroundImage(UIImage(named: "check_circle")?.sd_tintedImage(with: UTUColors.appColor), for: .normal)
        }else{
            statusButton.setBackgroundImage(UIImage(named: "info"), for: .normal)
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
    
    func hasNotch() -> Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
    @objc func moreAction(){
        //let defaultManager = MDCSnackbarManager()
        self.snackbarMessage.duration = 10.0
        if self.hasNotch() {
            self.defaultManager.setBottomOffset(UIScreen.main.bounds.height - 110)
        }else{
            self.defaultManager.setBottomOffset(UIScreen.main.bounds.height - 100)
        }
        //Utility.snackbarMessage.duration = 10
        //Utility.snackbarMessage.isNeedToDismiss = false
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

        let closeImage = UIImage(named: "cancel-24px", in: Bundle(identifier: "com.utu.utuframework"), compatibleWith: nil)
        moreButton.setImage(closeImage, for: .normal)
        moreButton.isUserInteractionEnabled = false
        customMessageView.addSubview(moreButton)

        snackbarTitleLbl.frame = CGRect(x: 40, y: 5, width: customMessageView.bounds.size.width - 40 - 40, height:customMessageView.frame.height - 10)
        statusButton.frame = CGRect(x: 8, y: (customMessageView.frame.height/2) - 12, width: 24, height: 25)
        snackbarTitleLbl.numberOfLines = 4
        customMessageView.isUserInteractionEnabled = false
    }
    @objc func closeAction(){
        //todo
        //messageInfinite.isNeedToDismiss = true
        DispatchQueue.main.async {
            self.customMessageView.isUserInteractionEnabled = false
            MDCSnackbarManager.dismissAndCallCompletionBlocks(withCategory: "infinite")
        }
    }
    /*static func showSnackbar(title: String, forSuccess : Bool){
        let message = MDCSnackbarMessage()
        let action = MDCSnackbarMessageAction()
        message.duration = 3
        let actionHandler = {() in
            //todo
        }
        action.handler = actionHandler
        message.action = action
        snackbarTitle = title
        isSuccess = forSuccess
        let defaultManager = MDCSnackbarManager.default
        
        defaultManager.snackbarMessageViewShadowColor = .none
        defaultManager.snackbarMessageViewBackgroundColor = .lightGray
        defaultManager.messageTextColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
        defaultManager.alignment = .center
        defaultManager.delegate = sharedInstance
        if Utility.hasNotch() {
            defaultManager.setBottomOffset(UIScreen.main.bounds.height - 100)
        }else{
            defaultManager.setBottomOffset(UIScreen.main.bounds.height - 75)
        }
        defaultManager.alignment = .center
        defaultManager.shouldApplyStyleChangesToVisibleSnackbars = true
        defaultManager.messageTextColor = .black
        defaultManager.show(message)
    }
    public func willPresentSnackbar(with messageView: MDCSnackbarMessageView?) {
        let view = UIView(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 16, height: 48))
        view.layer.cornerRadius = 4.0
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        let statusButton = UIButton(frame: CGRect(x: 8, y: 11, width: 24, height: 25))
        if Utility.isSuccess {
            statusButton.setBackgroundImage(UIImage(named: "check_circle")?.sd_tintedImage(with: UTUColors.appColor), for: .normal)
        }else{
            statusButton.setBackgroundImage(UIImage(named: "info"), for: .normal)
        }
        view.addSubview(statusButton)
        
        let titleLbl = UILabel(frame: CGRect(x: 40, y: 10, width: UIScreen.main.bounds.size.width - 32, height: 28))
        titleLbl.text = Utility.snackbarTitle
        titleLbl.textAlignment = NSTextAlignment.left
        titleLbl.numberOfLines = 2
        titleLbl.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        titleLbl.font = UIFont(name: UTUFontNames.NotoSansRegular, size: 10)
        view.addSubview(titleLbl)
        
        /*let closeButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width - 45, y: 11, width: 24, height: 25))
        closeButton.setImage(UIImage(named: "close24Px"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        view.addSubview(closeButton)*/
        messageView?.addSubview(view)
    }*/
    func reSizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    func getReadMessageDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        let tempDate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
        var dateString = date
        if tempDate != nil {
            dateString = dateFormatter.string(from: tempDate!)
        }
        return dateString
    }
    static func getYearMonth(date: String) -> String {
        let dateFormatter = DateFormatter()
        if date.contains("SSSSSSSZ") {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        }else{
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS"
        }
        let tempDate = dateFormatter.date(from: date)
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

        dateFormatter.dateFormat = "YYMM"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        var dateString = date
        if tempDate != nil {
            dateString = dateFormatter.string(from: tempDate!)
        }
        return dateString
    }
    static func getYearMonthDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        let tempDate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM yyyy"
        var dateString = date
        if tempDate != nil {
            dateString = dateFormatter.string(from: tempDate!)
        }
        return dateString
    }
    static func getDOB(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let tempDate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        var dateString = date
        if tempDate != nil {
            dateString = dateFormatter.string(from: tempDate!)
        }
        return dateString
    }
    static func getExpiry(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "MM/YY"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return  dateFormatter.string(from: date!)
    }
   
    static func getTargetName() -> String {
        return Bundle.main.infoDictionary?["CFBundleName"] as! String
    }
    static func showAlert(title:String, message:String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertController
    }
    static func getUrlBy(serviceKey : String, andBaseKey: String)->String{
        let baseUrl = sharedInstance.serviceDictionary?.value(forKeyPath: "\(getTargetName()).\(andBaseKey)") as! String
        if serviceKey.isEmpty {
            return baseUrl
        }
        let serviceUrl = sharedInstance.serviceDictionary?.value(forKeyPath: "\(andBaseKey).\(serviceKey)") as! String
        return "\(baseUrl)/\(serviceUrl)"
    }
//   static func getCountryObjectBy(name:String) -> Country {
//        if countryResObj == nil {
//            countryResObj = Utility.getCountryInfo()
//        }
//       let filterArray = countryResObj.Results!.filter({ (countryObj) -> Bool in
//            let tmp: NSString = countryObj.Name! as NSString
//            let range = tmp.range(of:name, options: .caseInsensitive)
//            return range.location != NSNotFound
//        })
//        /*if filterArray.count > 0 {
//            if
//            return filterArray.first!
//        }*/
//        for countryObj in filterArray {
//            if countryObj.Name == name {
//                return countryObj
//            }
//        }
//        let tempCountry = Country()
//        tempCountry.Name = name
//        tempCountry.Id = name
//        return tempCountry
//    }
//    static func getCountryObjectBy(prefix:String) -> Country {
//        if countryResObj == nil {
//            countryResObj = Utility.getCountryInfo()
//        }
//        let filterArray = countryResObj.Results!.filter({ (countryObj) -> Bool in
//            if countryObj.InternationalPrefix == nil {
//                return false
//            }
//            let tmp: NSString = countryObj.InternationalPrefix! as NSString
//            let range = tmp.range(of:prefix, options: .caseInsensitive)
//            return range.location != NSNotFound
//        })
//        return filterArray.first!
//    }
//    static func getCountryObjectBy(code:String) -> Country {
//        if countryResObj == nil {
//            countryResObj = Utility.getCountryInfo()
//        }
//        let filterArray = countryResObj.Results!.filter({ (countryObj) -> Bool in
//            let tmp: NSString = countryObj.Id! as NSString
//            let range = tmp.range(of:code, options: .caseInsensitive)
//            return range.location != NSNotFound
//        })
//        if filterArray.count > 0 {
//            return filterArray.first!
//        }
//        let tempCountry = Country()
//        tempCountry.Name = code
//        tempCountry.Id = code
//        return tempCountry
//    }
//    static func hasNotch() -> Bool {
//        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
//        return bottom > 0
//    }
//    static func getUserInfo() -> User {
//        if let savedUserInfo = UserDefaults.standard.object(forKey: "UserInfo") as? Data {
//        let decoder = JSONDecoder()
//        if let userInfo = try? decoder.decode(User.self, from: savedUserInfo) {
//            return userInfo
//        }
//      }
//        return User()
//    }
//    static func setUserInfo(obj:User){
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(obj) {
//            let defaults = UserDefaults.standard
//            defaults.set(encoded, forKey: "UserInfo")
//        }
//    }
//    static func getCountryInfo() -> CountryResponse {
//        if let savedUserInfo = UserDefaults.standard.object(forKey: "CountryResponse") as? Data {
//            let decoder = JSONDecoder()
//            if let responseObj = try? decoder.decode(CountryResponse.self, from: savedUserInfo) {
//                return responseObj
//            }
//        }
//        return CountryResponse()
//    }
//    static func setCountryInfo(obj:CountryResponse){
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(obj) {
//            let defaults = UserDefaults.standard
//            defaults.set(encoded, forKey: "CountryResponse")
//        }
//    }
//   static func convertBase64StringToImage (imageBase64String:String) -> UIImage {
//        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
//        let image = UIImage(data: imageData!)
//        return image!
//    }
//   static func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat {
//        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
//        label.numberOfLines = 0
//        label.lineBreakMode = NSLineBreakMode.byWordWrapping
//        label.font = font
//        label.text = text
//        label.sizeToFit()
//        return label.frame.height
//    }
//    func getImage(filterName: String, dataStr : String) -> UIImage {
//        let data = dataStr.data(using: String.Encoding.ascii)
//        guard let qrFilter = CIFilter(name: filterName) else { return UIImage()}
//        qrFilter.setValue(data, forKey: "inputMessage")
//        guard let qrImage = qrFilter.outputImage else { return UIImage()}
//        let transform = CGAffineTransform(scaleX: 10, y: 10)
//        let scaledQrImage = qrImage.transformed(by: transform)
//        let context = CIContext()
//        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return UIImage()}
//        let processedImage = UIImage(cgImage: cgImage)
//        return processedImage
//    }
//    // Get Thumbnail Image from URL
//     func getThumbnailFromUrl(_ url: String?, _ completion: @escaping ((_ image: UIImage?)->Void)) {
//
//        guard let url = URL(string: url ?? "") else { return }
//        DispatchQueue.main.async {
//            let asset = AVAsset(url: url)
//            let assetImgGenerate = AVAssetImageGenerator(asset: asset)
//            assetImgGenerate.appliesPreferredTrackTransform = true
//
//            let time = CMTimeMake(value: 2, timescale: 1)
//            do {
//                let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
//                let thumbnail = UIImage(cgImage: img)
//                completion(thumbnail)
//            } catch {
//                print("Error :: ", error.localizedDescription)
//                completion(nil)
//            }
//        }
//    }
}
