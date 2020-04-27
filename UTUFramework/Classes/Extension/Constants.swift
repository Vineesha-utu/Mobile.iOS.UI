//
//  Constants.swift
//  UTUTaxFree
//
//  Created by Lakshmana Swamy on 10/29/19.
//  Copyright © 2019 utu. All rights reserved.
//

import UIKit

let APP_TITLE      = "TaxFree"
let APP_CENTER_KEY = "c11348bb-db7e-4f32-8c3d-8dcaeab5ca18"
let CARD_SCAN_KEY = "zn1Eg_Nn1-kuVNk1VZ3SqfLQ8BH6Z1uz"
let screenSize = UIScreen.main.bounds.size
let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
let DefaultLanguage = "en-GB"

struct UTUFontNames {
    static let NotoSansBold = "NotoSans-Bold"
    static let NotoSansRegular = "NotoSans"
    static let NotoSansBoldItalic = "NotoSans-BoldItalic"
    static let NotoSansItalic = "NotoSans-Italic"
}
struct UTUImage {
    static let kShowIcon = "showIcon"
    static let kHideIcon = "hide"
    static let kPlaceHolder = "placeholder.png"
    static let kClose = "close24Px"
    static let kHelpIcon = "helpIcon"
    static let kBackArrow_black = "arrow_back-24px"
    static let kBackArrow_white = "backArrow"
    static let kCard_Icon = "card_icon"
    static let kProfile_Icon = "profile_icon"
    static let kVisa_Card = "Card Logo Visa"
    static let kVisa_White = "visa_cardface"
    static let kMaster_Card = "Card Logo MC"
    static let kJCB_Card = "Card Logo JCB"
    static let kUnionPay_Card = "cardLogoUpStaged"
    static let kAddCircle = "addCircleOutline24Px1"
    static let kArrow_Black_Icon = "arrow_black"
    static let kCheck_Black = "check_black"
    static let kEmptyactivity = "emptyactivity"
    static let kRadioActive = "radio_active"
    static let kRadio_Active_Red = "radio_active_red"
    static let kRadio = "radio"
    static let kActivity_Details = "activitydetails"
    static let kActivityEmptyList = "ActivityEmptyLIst"
    static let kEmail = "mail24Px"
    static let kUnread_Email = "unread_mail"
    static let kLocation_white = "location_white"
    static let kFavorite_white = "favorite_white"
    static let kShare = "share"
    static let kLocation = "location1"

}
struct UTUStrings {
    static let AppName = "TaxFree"
    static let kLogin = "Log in"
    static let kUserName = "UserName"
    static let kEmail = "Email"
    static let kPassword = "Password"
    static let kDisplayName = "DisplayName"
    static let kResponseStatus = "ResponseStatus"
    static let kAUTH_URL = "AUTH_URL"
    static let kCMS_URL = "CMS_URL"
    static let kISOCODE_URL = "ISOCODE_URL"
    static let kMEMBER_URL = "MEMBER_URL"
    static let kMEMBER_BALANCE_URL = "MEMBER_BALANCE_URL"
    static let kVOUCHER_URL = "VOUCHER_URL"

    static let kPLUS_URL = "PLUS_URL"
    static let kPROMO_URL = "PROMOTION_URL"
    static let kNOTIFICATIONS_URL = "NOTIFICATIONS_URL"
    static let kCountryOfResidence = "Country of residence"
    static let kMemberId = "Member Id"
    static let kCreate_Password = "Create a Password"
    static let kLoading = "Loading..."
    static let kName = "Name"
    static let kMobile = "Mobile"
    static let kCamera = "Camera"
    static let kGallery = "Gallery"
    static let kCancel = "Cancel"
    static let kSomethingWentWrong = "Something went wrong. Please try again later"
    static let kUpdateSuccess = "Profile has been updated successfully"
    static let kInValidEmail = "Please enter a valid email"
    static let kUTUID = "UTU ID"
    static let kAddCard = "Add card"
    static let kCardHolderName = "Cardholder name"
    static let kCardNumber = "Card number"
    static let kExpiryDate = "Expiry date"
    static let kDateOfBirth = "Date of birth"
    static let kVerifyYourAccount = "Verify your account"
    static let kFillAllRequiredValues = "Please Fill All Values"
    static let kCVV = "CVV"
    static let kDeleteConfirm = "Delete card?"
    static let kConfirm = "Confirm"
    static let kPaymentmethods = "Payment methods"
    static let kVerifyCard = "Verify your card"
    static let kHaveUTUID = "Register with UTU ID"
    static let kValidEmailMsg = "Please enter a valid email"
    static let kValidPasswordMsg = "Password must contain at least 8 characters; Must contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character"
    static let kValidCountryCodeMsg = "Please select a country code"
    static let kAcceptTermsOfUseMsg = "Please accept the Terms & Conditions"
    static let kAcceptPrivacyMsg = "Please accept the Privacy Policy"
    static let kYouCannotTestInSimulator = "You are unable to test this functionality in simulator"
    static let kRenewNow = "Renew now"
    static let kPreferedPaymentMethod = "Add your preferred payment method."
    static let kActivate = "Activate"
    static let kDirect = "Direct"
    static let kAccount = "Account"
    static let kWalletNew = "Wallet"

    static let kAccountEmptyListMsg = "You have no recent activity."
    static let kRecentActivity = "Recent Activity"
    static let kViewAll = "View all"
    static let kBrand = "Brand"
    static let kCardVerification = "Verify your card"
    static let kVerifyCardMsg = "This card has not been verified yet."
    static let kVerify = "Verify"
    static let kUnverified = "Unverified"
    static let kEnterCVVMsg = "Enter CVV to verify your card ending in"
    static let kActivity = "Activity"
    static let kMyVouchers = "My Vouchers"

}
struct UTUViewName {
    static let kUTU_EmptyListView = "UTU_EmptyListView"
    static let kUTU_AddCardView = "UTU_AddCardView"

}
struct UTUViewControllers {
    static let kDatePickerViewController = "DatePickerViewController"
    static let kUTUScannerViewController = "UTUScannerViewController"
    static let kUTUAlertController = "UTUAlertController"
    static let kUTU_AccountActivityListVC = "UTU_AccountActivityListVC"
    static let kUTU_ActivityViewController = "UTU_ActivityViewController"
    static let kUTUPickerViewController = "UTUPickerViewController"

}
struct UTUKey {
    static let kIsLogin = "isLogin"
    static let kMessage = "Message"
    static let kRequestId = "RequestId"
    static let kNickname = "Nickname"
    static let kResponseStatus = "ResponseStatus"
    static let kVISA = "Visa"//"VISA"
    static let kMASTERCARD = "Mastercard"//"MASTERCARD"
    static let kAmericanExpress = "AmericanExpress"
    static let kDinersClub = "DinersClub"
    static let kDiscover = "Discover"
    static let kJCB = "JCB"
    static let kUNIONPAY = "UnionPay"//"CHINA UNIONPAY"
    static let kMaestro = "Maestro"
    static let kElo = "Elo"
    static let kMir = "Mir"
    static let kHiper = "Hiper"
    static let kHipercard = "Hipercard"
    static let kUserInfo = "UserInfo"
    static let kMember = "Member"
    static let kId = "Id"
    static let kPlusCardStatus = "PlusCardStatus"
    static let kAppLanguage = "AppLanguage"
    static let kBearerToken = "BearerToken"
    static let kRefreshToken = "RefreshToken"
    static let kUserId = "UserId"
    static let kDateOfBirth = "DateOfBirth"
    static let kPIN = "PIN"
    static let kPassword = "Password"
    static let kMobileAppLanguage = "MobileAppLanguage"
    static let kPushChannel = "PushChannel"
    static let kPushHandle = "PushHandle"
    static let kOldPassword = "OldPassword"
    static let kNewPassword = "NewPassword"
    static let kConfirmPassword = "ConfirmPassword"
    static let kActivation = "Activation"
    static let kCompleted = "Completed"
    static let kProcess = "Process"
    static let kIsFirstTimePlusVisit = "isFirstTimePlusVisit"
    static let kIsFirstTimeVoucherVisit = "isFirstTimeVoucherVisit"
    static let kIsFirstTimeDirectVisit = "isFirstTimeDirectVisit"
    static let kIsFirstTimeQuickTutorialVisit = "isFirstTimeQuickTutorialVisit"
    static let kRefundCurrency = "RefundCurrency"
    static let kRefundTotal = "RefundTotal"
    static let kVoucherCount = "VoucherCount"
    
    static let kHighLightTitle = "HighLightTitle"
    static let kHowItWorkTitle = "HowItWorkTitle"
    static let kFeaturedCityTitle = "FeaturedCityTitle"
    static let kRefundShoppingTitle = "RefundShoppingTitle"

}
struct UTUServiceKey {
    static let kSignupUTUID = "signupUTUID"
    static let kGetAllActivities = "getAllActivities"
    static let kSetDefaultCard = "setDefaultCard"
    static let kGetCards = "getCards"
    static let kPlusCardActivate = "plusCardActivate"
    static let kPlusCardRenew = "plusCardRenew"
    static let kGetAllNotifications = "getAllNotifications"
    static let kGetAllUnreadNotifications = "getAllUnreadNotifications"
    static let kDeleteNotification = "deleteNotification"
    static let kGetAllVouchers = "getAllVouchers"
    static let kGetRefundTransactions = "getRefundTransactions"
    static let kMarkAsRead = "inboxMarkAsRead"


}
struct UTUKeySegue {
    static let kUTUID_TO_VerificationSegue = "UTUIDTOVerificationSegue"
    static let kVerificationToRegistrationSegue = "VerificationToRegistrationSegue"
    static let kCarouselToCVVSegue = "CarouselToCVVSegue"
    static let kShowCardListToCarousalSegue = "ShowCardListToCarousalSegue"
    static let kCardListToAddCardSegue = "CardListToAddCardSegue"
    static let kCardCVVToWebviewSegue = "CardCVVToWebviewSegue"
    static let kCVVToUnionPaySegue = "CVVToUnionPaySegue"
    static let kSettingsToCardListSegue = "SettingsToCardListSegue"
    static let kSignupUTUIDToDashboardSegue = "SignupUTUIDToDashboardSegue"
    static let kPlusPaymentListToAddCardSegue = "PlusPaymentListToAddCardSegue"
    static let kPlusToPaymentMethodSegue = "PlusToPaymentMethodSegue"
    static let kUTUPlusToCardVerifySegue = "UTUPlusToCardVerifySegue"
    static let kUTUPlusToLoginSegue = "UTUPlusToLoginSegue"
    static let kDirectToWelcomeSegue = "DirectToWelcomeSegue"
    static let kAccountToWelcomeSegue = "AccountToWelcomeSegue"
    static let kPlusPaymentToCardVerifySegue = "PlusPaymentToCardVerifySegue"
    static let kPlusPaymentVerifyToWebViewSegue = "PlusPaymentVerifyToWebViewSegue"
    static let kProfileToActivitySegue = "ProfileToActivitySegue"
    static let kInboxToWelcomeSegue = "InboxToWelcomeSegue"
    static let kVoucherToWelcomeSegue = "VoucherToWelcomeSegue"
    static let kDirectToDetailActivitySegue = "DirectToDetailActivitySegue"
    static let kRefundToDetailActivitySegue = "RefundToDetails"    
    
}
struct UTUCellIdentifier {
    static let kTextFieldCell = "UTU_TextFieldCell"
    static let kButtonFieldCell = "UTU_ButtonFieldCell"
    static let kCountryFieldCell = "UTU_CountryFieldCell"
    static let kSignupCheckBoxCell = "UTU_SignupCheckBoxCell"
    static let kExpiryDateFieldCell = "UTU_ExpiryDateFieldCell"
    static let kCardTableViewCell = "UTU_CardTableViewCell"
    static let kDefaultCardTableViewCell = "UTU_DefaultCardTableViewCell"
    static let kUTU_PlusTableViewCell = "UTU_PlusTableViewCell"
    static let kUTU_AccountActivityCell = "UTU_AccountActivityCell"
    static let kUTU_InboxTableViewCell = "UTU_InboxTableViewCell"
    static let kUTU_VoucherTableViewCell = "UTU_VoucherTableViewCell"
    static let kUTU_VoucherDetailTableCell = "UTU_VoucherDetailTableCell"
    static let kUTU_HomeTableViewCell = "UTU_HomeTableViewCell"
    static let kUTU_ExploreTableViewCell = "UTU_ExploreTableViewCell"    
}
struct UTUColors {
    static let appColor = UIColor(red: 0/255, green: 179/255, blue: 152/255, alpha: 1)
    static let navBarColor = UIColor(red: 204.0/255, green: 76.0/255, blue: 70.0/255, alpha: 1)
    static let navBarTitleColor = UIColor.white
    static let statusTxtColor = UIColor(red: 104.0/255, green: 158.0/255, blue: 49.0/255, alpha: 1)
    static let borderColor = UIColor(red: 213.0/255, green: 213.0/255, blue: 213.0/255, alpha: 1)
    static let appViolet = UIColor(red: 151.0/255, green: 118.0/255, blue: 181.0/255, alpha: 1)
    static let floatingPlaceholderActiveColor = UIColor(red: 0/255, green: 179/255, blue: 152/255, alpha: 1)
    static let leadingUnderlineLabelTextColor = UIColor(red: 0/255, green: 179/255, blue: 152/255, alpha: 1)
    static let activeColor = UIColor(red: 0/255, green: 179/255, blue: 152/255, alpha: 1)
    static let buttonBackgroundColor = UIColor(red: 0/255, green: 179/255, blue: 152/255, alpha: 1)
    static let lightGray = UIColor(red:213/255, green: 213/255, blue: 213/255, alpha: 1)
    static let darkGray = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    static let loadingColor = UIColor(red: 0/255, green: 179/255, blue: 152/255, alpha: 1)
    static let visaColor = UIColor(red: 0/255, green: 102/255, blue: 178/255, alpha: 1)
    static let masterColor = UIColor(red: 107/255, green: 18/255, blue: 109/255, alpha: 1)
    static let jcbColor = UIColor(red: 255/255, green: 153/255, blue: 72/255, alpha: 1)
    static let unionPayColor = UIColor(red: 226/255, green: 36/255, blue: 54/255, alpha: 1)
    static let white245 = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    static let white243 = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
    static let white213 = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1)
    static let black30 = UIColor(red: 30/255, green: 30/255, blue: 32/255, alpha: 1)
    static let brownishGray = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)

}
