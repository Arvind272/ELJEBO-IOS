//
//  ServicesSignUpVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class ServiceProviderSignUpVC: UIViewController {
    // MARK: - IBOUTLET
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet var btnSignUp : UIButton!
    
    // MARK: - VARIABLE
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - IBACTIONS
    
    
    @IBAction func actionNext(_ sender: Any) {
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "OtpCodeVC", isAnimate: true, currentViewController: self)
        
    }
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    

}
