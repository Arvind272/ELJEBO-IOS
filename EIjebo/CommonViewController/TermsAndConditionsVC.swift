//
//  TermsAndConditionsVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class TermsAndConditionsVC: UIViewController ,UIWebViewDelegate {
    
    @IBOutlet weak var btnSelectTermCondtions: UIButton!
    @IBOutlet weak var webVwTermAndCondtion: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webVwTermAndCondtion.delegate = self
        let htmlStr = "
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
    }."
        
        webVwTermAndCondtion.loadHTMLString(htmlStr, baseURL: nil)
        cell.imgVwCertificate.image = objServicesSignupVM.imagesArray[indexPath.row]
        cell.btnCross.tag = indexPath.row
        cell.btnCross.addTarget(self, action: #selector(deleteImage(_:)), for: .touchUpInside)
    }
    
    //MARK:- Actions
    
    @IBAction func actionTermCondition(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    @IBAction func actionBack(_ sender: Any) {
        
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
        
    }
    @IBAction func actionsGo(_ sender: Any) {
        let storyboard = self.storyboard
        if storyboard == StoryboardType.customerStoryboard{
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier:"OtpCodeVC", isAnimate: true, currentViewController: self)
        }
        else {
               Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier:"OtpCodeVC", isAnimate: true, currentViewController: self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
