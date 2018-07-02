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
        let htmlStr = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
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
