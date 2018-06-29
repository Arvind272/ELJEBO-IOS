//
//  LoginVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    // MARK: - IBOUTLET
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet var btnSignUp : UIButton!
    // MARK: - VARIABLE
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = Proxy.shared.createAttributedString(fullString: "Don't have an account ? SIGN UP", fullStringColor: .black, subString: "SIGN UP", subStringColor: AppInfo.redColor)
        btnSignUp.setAttributedTitle(title, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      // MARK: - IBACTIONS
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    @IBAction func actionForgot(_ sender: Any) {
        let storyboard = self.storyboard
        if storyboard == StoryboardType.customerStoryboard{
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier:"ForgotPassVC", isAnimate: true, currentViewController: self)
        }else{
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "ForgotPassVC", isAnimate: true, currentViewController: self)
        }
    }
    @IBAction func actionSignUp(_ sender: Any) {
        let storyboard = self.storyboard
        if storyboard == StoryboardType.customerStoryboard{
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "SignUpVC", isAnimate: true, currentViewController: self)
        }else{
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "ServiceProviderSignUpVC", isAnimate: true, currentViewController: self)
        }
    }
 
    @IBAction func actionSignIn(_ sender: Any) {
        KAppDelegate.isForgot = false
         let storyboard = self.storyboard
        if storyboard == StoryboardType.customerStoryboard{
           
        
            if txtUserName.text!.isEmpty {
                Proxy.shared.displayStatusCodeAlert(AlertValue.username)
            }
            else if txtPassword.text!.isEmpty {
                Proxy.shared.displayStatusCodeAlert(AlertValue.password)
            }else{
                
                objLoginVM.userName = txtUserName.text!
                objLoginVM.password = txtPassword.text!
                objLoginVM.user_type = "1"
                objLoginVM.loginApi {
                    RootControllerProxy.shared.goWithDrawer(storyboard: StoryboardType.customerStoryboard, identifier: "HomeVC")
                }
            }
        }else{
            if txtUserName.text!.isEmpty {
                Proxy.shared.displayStatusCodeAlert(AlertValue.username)
            }
            else if txtPassword.text!.isEmpty {
                Proxy.shared.displayStatusCodeAlert(AlertValue.password)
            }else{
                
                objLoginVM.userName = txtUserName.text!
                objLoginVM.password = txtPassword.text!
                objLoginVM.user_type = "2"
                objLoginVM.loginApi {
                    RootControllerProxy.shared.goWithDrawer(storyboard: StoryboardType.serviceProviderStoryboard, identifier: "ServicesHomeVC")
                }
            }
    }
}
    
}
