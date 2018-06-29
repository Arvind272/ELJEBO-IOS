//
//  OtpCodeVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class OtpCodeVC: UIViewController,UITextFieldDelegate {
    // MARK: - IBOUTLET
    @IBOutlet weak var lblHeading: UILabel!
    
    @IBOutlet weak var txtCode: UITextField!
    
    // MARK: - VARIABLE
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attr = NSMutableAttributedString(string: "Enter 6 digit OTP code sent to your email.")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attr.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attr.length))
        lblHeading.attributedText = attr;
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - IBACTIONS
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    @IBAction func actionSend(_ sender: Any) {
        let storyboard = self.storyboard
        if storyboard == StoryboardType.customerStoryboard{
            if  KAppDelegate.isForgot == true{
                
                for controller in self.navigationController!.viewControllers as Array {
                    if controller.isKind(of: LoginVC.self) {
                        KAppDelegate.isForgot = false
                        self.navigationController!.popToViewController(controller, animated: true)
                        break
                    }
                }
            }
            else{
               objOtpVM.otp = self.txtCode.text
               let user_id = UserDefaults.standard.value(forKey: "user_id") as! String
               objOtpVM.userId = user_id
                objOtpVM.otpVerifyApi {
                      RootControllerProxy.shared.goWithDrawer(storyboard: StoryboardType.customerStoryboard, identifier: "HomeVC")
                }
              
            }
        }else{
            if  KAppDelegate.isForgot == true{
                for controller in self.navigationController!.viewControllers as Array {
                    if controller.isKind(of: LoginVC.self) {
                        KAppDelegate.isForgot = false
                        self.navigationController!.popToViewController(controller, animated: true)
                        break
                    }
                }
                
            }
            else{
                RootControllerProxy.shared.goWithDrawer(storyboard: StoryboardType.serviceProviderStoryboard, identifier: "ServicesHomeVC")
            }
        }
    }
 
}
