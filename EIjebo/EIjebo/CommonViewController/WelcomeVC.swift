//
//  WelcomeVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    // MARK: - IBOUTLET
    @IBOutlet var lblWelcome : UILabel!
    // MARK: - VARIABLE
   
    // MARK: - LIFECYCLE
   
    override func viewDidLoad() {
        super.viewDidLoad()
       lblWelcome.attributedText = Proxy.shared.createAttributedString(fullString: "Welcome to Eljebo!", fullStringColor: .black, subString: "Eljebo!", subStringColor: AppInfo.redColor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
     // MARK: - IBACTIONS
   
    @IBAction func actionServicesProvider(_ sender: Any) {
      Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "LoginVC", isAnimate: true, currentViewController: self)
    }
    @IBAction func actionUser(_ sender: UIButton) {
       Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "LoginVC", isAnimate: true, currentViewController: self)
    }
}
