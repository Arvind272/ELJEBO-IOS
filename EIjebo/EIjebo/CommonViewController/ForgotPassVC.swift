//
//  FogotPassVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class ForgotPassVC: UIViewController, UITextFieldDelegate {
 // MARK: - IBOUTLET
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtAns3: UITextField!
    @IBOutlet weak var txtAns2: SetCornerView!
    @IBOutlet weak var txtAns1: UITextField!
    @IBOutlet weak var txtQuestions3: UITextField!
    @IBOutlet weak var txtQuestions2: UITextField!
    @IBOutlet weak var txtQuestions1: UITextField!
    // MARK: - VARIABLE
    
     // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

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
        KAppDelegate.isForgot = true
        if storyboard == StoryboardType.customerStoryboard{
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "OtpCodeVC", isAnimate: true, currentViewController: self)
        }else{
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "OtpCodeVC", isAnimate: true, currentViewController: self)
        }
       
    }
   
}
