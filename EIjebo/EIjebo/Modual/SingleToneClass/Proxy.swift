 //
 //  WebServiceProxy.swift
 //  Eljbo
 //
 //  Created by Ankita Thakur on 15/06/18.
 //  Copyright © 2018 Sukhpreet Kaur. All rights reserved.
 //
 import Foundation
 import GoogleMaps
 import GooglePlaces
import Alamofire
 import Photos
 import SKToast
 import NVActivityIndicatorView
 //import SwiftSpinner
 let KAppDelegate = UIApplication.shared.delegate as! AppDelegate
 
 class Proxy {
    static var shared: Proxy {
        return Proxy()
    }
    fileprivate init(){}
    
    //MARK:- Common Methods
    func authNil() -> String {
        if let authCode = UserDefaults.standard.object(forKey: "access-token") as? String {
            return authCode
        } else {
            return ""
        }
    }
    //MARK:- Push Method
    func pushToNextVC(storyborad: UIStoryboard,identifier:String, isAnimate:Bool , currentViewController: UIViewController) {
        let pushControllerObj = storyborad.instantiateViewController(withIdentifier: identifier)
        currentViewController.navigationController?.pushViewController(pushControllerObj, animated: isAnimate)
    }
    //MARK:- Pop Method
    func popToBackVC(isAnimate:Bool , currentViewController: UIViewController) {
        currentViewController.navigationController?.popViewController(animated: isAnimate)
    }
    func presentToVC(storyborad:UIStoryboard,identifier:String, isAnimate:Bool , currentViewController: UIViewController) {
        var presentControllerObj = storyborad.instantiateViewController(withIdentifier: identifier)
        currentViewController.navigationController?.present(presentControllerObj, animated: isAnimate, completion: nil)
    }
    
    
    func createAttributedString(fullString: String, fullStringColor: UIColor, subString: String, subStringColor: UIColor) -> NSMutableAttributedString
    {
        let range = (fullString as NSString).range(of: subString)
        let attributedString = NSMutableAttributedString(string:fullString)
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: fullStringColor, range: NSRange(location: 0, length: fullString.count))
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: subStringColor, range: range)
        return attributedString
    }
    func withTextSizeAttributedString(fullString: String, fullStringColor: UIColor, subString: String, subStringColor: UIColor) -> NSMutableAttributedString
    {
        let range = (fullString as NSString).range(of: subString)
        let attributedString = NSMutableAttributedString(string:fullString)
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: fullStringColor, range: NSRange(location: 0, length: fullString.count))
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: subStringColor, range: range)
        attributedString.addAttribute(NSAttributedStringKey.font, value: subStringColor, range: range)
        attributedString.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "Arial-Rounded", size: 40)!, range: range)
        return attributedString
    }
    //MARK:- Map Methods
    func setDefaultLocation(mapView: GMSMapView) {
        mapView.clear()
        if UserDefaults.standard.object(forKey: "lat") != nil &&  UserDefaults.standard.object(forKey: "long") != nil {
            let currentLat = UserDefaults.standard.value(forKey: "lat") as! String
            let currentLong = UserDefaults.standard.value(forKey: "long") as! String
            let sourceLocation = CLLocationCoordinate2D(latitude: Double(currentLat)! as CLLocationDegrees, longitude: Double(currentLong)! as CLLocationDegrees)
            var pickupMarker = GMSMarker()
            pickupMarker = GMSMarker(position: sourceLocation)
            pickupMarker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
            pickupMarker.tracksViewChanges = true
            pickupMarker.icon = #imageLiteral(resourceName: "ic_loc_map")
            pickupMarker.map = mapView
            mapView.setRegion(sourceLocation: sourceLocation)
        }
    }
    
    func getDateFrmString(getDate:String, format: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //("yyyy-MM-dd HH:mm:ss")"
        let dateInStr = dateFormatter.date(from: getDate)
        if dateInStr != nil{
            return dateInStr!
        }else{
            return Date()
        }
    }
    
    func getStringFrmDate(getDate:Date, format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //"yyyy-MM-dd hh:mm"
        let dateInStr = dateFormatter.string(from: getDate)
        return dateInStr
    }
    //MARK:- Display Toast
    func displayStatusCodeAlert(_ userMessage: String) {
         SKToast.show(withMessage: userMessage)
    }
    //MARK:- Check Valid Email Method
    func isValidEmail(_ testStr:String) -> Bool  {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return (testStr.range(of: emailRegEx, options:.regularExpression) != nil)
    }
    func isValidname(_ testStr:String) -> Bool  {
        let emailRegEx = "[A-Za-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return (testStr.range(of: emailRegEx, options:.regularExpression) != nil)
    }
    //MARK:- Check Valid Password Method
    func isValidPassword(_ testStr:String) -> Bool  {
        let emailRegEx = "^.*(?=.{8})(?=.*[a-zA-Z])(?=.*\\d)(?=.*[!@#$%&*_.()])[a-zA-Z0-9!@#$%&*_.]+$"
        return (testStr.range(of: emailRegEx, options:.regularExpression) != nil)
    }
    func getFormatter(_ formatPattern: String)-> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = formatPattern
        return formatter
    }
    // MARK : Button And View Anamitions
    func setCorner(_ button : UIButton , borderWidth:CGFloat, borderColor: UIColor ) {
        button.layer.cornerRadius = button.frame.size.height/2
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
    }
    func setImageCorner(_ image : UIImageView , borderWidth:CGFloat, borderColor: UIColor ) {
        image.layer.cornerRadius = image.frame.size.height/2
        image.layer.borderWidth = borderWidth
        image.layer.borderColor = borderColor.cgColor
    }
    func dropShadow(_ view:UIView ,color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowOffset = offSet
        view.layer.shadowRadius = radius
        view.clipsToBounds = true
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
    //MARK: - HANDLE ACTIVITY
    func showActivityIndicator() {
         // SwiftSpinner.show("Loading", animated: true)
        DispatchQueue.main.async
            {
                let activityData = ActivityData()
                NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        }
    }
    func dismissKeyboard(currentViewController: UIViewController) {
        currentViewController.view.endEditing(true)
    }
    func hideActivityIndicator()  {
       
        DispatchQueue.main.async {
            
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
    }
    //MARK:- Latitude Method
    func getLatitude() -> String
    {
        if UserDefaults.standard.object(forKey: "lat") != nil {
            let currentLat =  UserDefaults.standard.object(forKey: "lat") as! String
            return currentLat
        }
        return ""
    }
    //MARK:- Longitude Method
    func getLongitude() -> String
    {
        if UserDefaults.standard.object(forKey: "long") != nil {
            let currentLong =  UserDefaults.standard.object(forKey: "long") as! String
            return currentLong
        }
        return ""
    }
    func openSettingApp() {
        let settingAlert = UIAlertController(title: "Connection Problem", message: "Please check your internet connection", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        settingAlert.addAction(okAction)
        let openSetting = UIAlertAction(title:"Setting", style:UIAlertActionStyle.default, handler:{ (action: UIAlertAction!) in
            let url:URL = URL(string: UIApplicationOpenSettingsURLString)!
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: {
                    (success) in })
            } else {
                guard UIApplication.shared.openURL(url) else {
                    Proxy.shared.displayStatusCodeAlert("Please Review your network settings")
                    return
                }
            }
        })
        settingAlert.addAction(openSetting)
        UIApplication.shared.keyWindow?.rootViewController?.present(settingAlert, animated: true, completion: nil)
    }
    //MARK:- LOCATION SETTING
    func openLocationSettingApp() {
        let settingAlert = UIAlertController(title: "Location Problem", message: "Please enable your location", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        settingAlert.addAction(okAction)
        let openSetting = UIAlertAction(title:"Setting", style:UIAlertActionStyle.default, handler:{ (action: UIAlertAction!) in
            let url:URL = URL(string: UIApplicationOpenSettingsURLString)!
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: {
                    (success) in })
            } else {
                guard UIApplication.shared.openURL(url) else {
                    //Proxy.shared.displayStatusCodeAlert(SuccessAlertValue.reviewSettings)
                    return
                }
            }
        })
        settingAlert.addAction(openSetting)
        UIApplication.shared.keyWindow?.rootViewController?.present(settingAlert, animated: true, completion: nil)
    }
    
    //MARK:- logout Method
    //    func logout(_ completion:@escaping() -> Void){
    //        WebServiceProxy.shared.getData("\(Apis.KServerUrl)\(Apis.KLogout)", showIndicator: true, completion: { (JSON) in
    //            if JSON["status"] as! Int == 200 {
    //                  userModelObj = UserModel()
    //                UserDefaults.standard.set("", forKey: "access-token")
    //                UserDefaults.standard.synchronize()
    //                completion()
    //            } else {
    //
    //                   Proxy.shared.displayStatusCodeAlert(JSON["error"] as? String ?? "Error")
    //
    //            }
    //            self.hideActivityIndicator()
    //        })
    //    }
 }
