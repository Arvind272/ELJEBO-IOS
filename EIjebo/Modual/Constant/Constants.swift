//
//  Constants.swift
//  Foosto
//
//  Created by Sukhpreet Kaur on 3/10/18.
//  Copyright © 2018 Sukhpreet Kaur. All rights reserved.
//

import Foundation
import UIKit
enum AppInfo {
    static let Mode = "development"
    static let AppName = "Eljebo"
    static let Version =  "1.0"
    static let DeviceName = UIDevice.current.name
    static let RoleID = "2"
    static let UserAgent = "\(Mode)/\(AppName)/\(Version)"
    static let AppColor = UIColor(red: 238/255, green:109/255, blue: 40/255, alpha: 1)
    static let PlaceHolderColor = UIColor(red:196/255, green: 214/255, blue: 229/255, alpha: 1)
    static let redColor = UIColor(red:248/255, green: 22/255, blue: 22/255, alpha: 1)
    
}
//getCountryList
enum Apis {
    static let KServerUrl =  "http://jupiter.toxsl.in/eljebo/"
    static let KUserCheck = "\(Apis.KServerUrl)user/check"
    static let KLogin = "user/login"
    static let KLogout = "user/logout"
    static let KSignup = "api/user/provider-signup"
    static let KCustomerSignup = "api/user/customer-signup"
    static let KServicesList = "api/service/list"
    static let KCountryList = "api/service/country-list"
    static let KStateList = "api/service/state-list?country_id="
    static let KCityList = "api/service/city-list?state_id="
    static let KMapProvideAPIKey = "AIzaSyDHkpVIkBLLdfk7vl-qGOM5B3I5CYZfNjo"

    //param hai
    
}


enum StoryboardType{
    public static let serviceProviderStoryboard = UIStoryboard(name: "ServiceProvider", bundle: nil)
    public static let customerStoryboard = UIStoryboard(name: "Main", bundle: nil)
}
enum Gender : Int{
      case male  = 0 , female , others
}
enum Education : Int {
    case ged  = 0, high , collage
}
enum CardType : Int {
    case credit  = 0, debit , atm, paypal
}
enum AlertValue {
    static var firstname =  "Please enter first name"
    static var lastname =  "Please enter first name"
    static var email =  "Please enter email"
    static var emailconf =  "Please enter confirm email"
    static var conemail =  "Email should be same"
    static var username =  "Please enter user name"
    static var phoneNumber =  "Please enter phone number"
    static var password = "Please enter password"
    static var passwordConf = "Please enter Confirm password"
    static var confirmPass  =  "Password should be same"
    static var address =  "Please enter address"
    static var country   =  "Please enter country"
    static var city   =  "Please enter city"
    static var state   =  "Please enter state"
    static var zipcode  =  "Please enter zip code"
    static var selectgender  =  "Please select Gender"
    static var securityQus1  =  "Please write Security Questions 1"
    static var securityQus2  =  "Please write Security Questions 2"
    static var securityQus3  =  "Please write Security Questions 3"
    static var securityans1  =  "Please write Security Answer 1"
    static var securityans2  =  "Please write Security Answer 2"
    static var securityans3  =  "Please write Security Answer 3"
     static var selectEducation  =  "Please select Education"
     static var certificate   =  "Please enter your certificate or license"
    static var time   =  "Please select time"
  // card details
    static var cardNumber = "Please enter card number"
     static var cardHolder = "Please enter card holder name"
    static var expDate = "Please enter exp. month and year"
    static var cvvNumber = "Please enter CVV"
    static var cvvValid = "Please enter valid CVV"
    // Error
    static var jsonError = "Error: Unable to encode JSON"
    static var urlError = "Please check the URL : 400"
    static var sessionError = "Session Logged out"
    static var urlNotExist = "URL does not exists : 404"
    static var serverError = "Server error, Please try again.."
   
 static var newPassword  =  "Please enter new password"
}
enum SuccessAlertValue {
    static var changePassword = "Password changes succssefully"
    static var updateProfile  = "Profile update successfully"
    static var imageDeleted  = "Image deleted successfully"
    static var reviewSettings  = "Please Review your network settings"
    static var fbLoginFailed  = "Facebook login failed"
    static var imageAdded  = "Image added successfully"
    static var profileUploaded  = "Profile uploaded"
    static var addressAdded  = "Address added successfully"
    static var IDAdded  = "ID added successfully"
    static var menuAdded  = "Menu added successfully"
    static var orderPlaced  = "Order placed successfully"
    static var itemAdded  = "Item added successfully"
    static var itemUpdated   = "Item updated successfully"
    static var promocodeSaved  = "Promo code saved"
}


