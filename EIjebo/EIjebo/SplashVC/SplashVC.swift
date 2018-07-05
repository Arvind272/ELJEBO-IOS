//
//  SplashVC.swift
//  Tawseleh
//
//  Created by Nikita Kalra on 15/03/18.
//  Copyright © 2018 Pushpinder Kaur. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import IQKeyboardManagerSwift

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(Apis.KMapProvideAPIKey)
        GMSPlacesClient.provideAPIKey(Apis.KMapProvideAPIKey)
        let locationManager = locationManagerClass.sharedLocationManager()
        locationManager.startStandardUpdates()
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
        UIApplication.shared.statusBarStyle = .lightContent
       // sleep(UInt32(3.0))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkAuthcode()
    }
    
    //MARK: Check Authcode
    func checkAuthcode()
    {
//        if let auth = UserDefaults.standard.value(forKey: "auth_code") as? String {
//            if auth == "" {
               // Proxy.shared.pushToNextVC(storyborad: storyBoard, identifier: "SignInVC", isAnimate: true, currentViewController: self)
//            }else {
////                if  !KAppDelegate.didStartFromNotification {
////                   checkApiMethodWithoutNotification()
////                }
//            }
//        }else {
           // Proxy.shared.pushToNextVC(storyborad: storyBoard, identifier: "SignInVC", isAnimate: true, currentViewController: self)
       //  Proxy.shared.rootWithoutDrawer(StoryboardType.customerStoryboard, identifier: "WelcomeVC")
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "WelcomeVC", isAnimate: false, currentViewController: self)
//        }
    }
    
    //MARK:- Check Api Without Notification
//    func checkApiMethodWithoutNotification() {
//        let auth = UserDefaults.standard.value(forKey: "auth_code") as! String
//        WebServiceProxy.shared.getData("\(Apis.KUserCheck)\(auth)", showIndicator: false) { (JSON) in
//            if JSON["status"] as! Int == 200 {
//                if let detail = JSON["detail"] as? NSDictionary {
//                    profileModelObj.setUserWith(detail: detail)
//                    RootControllerProxy.shared.gotoDrawer(identifier:"HomeVC")
//
//                }
//            } else {
//                Proxy.shared.pushToNextVC(storyborad: storyBoard, identifier: "SignInVC", isAnimate: true, currentViewController: self)
//            }
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
