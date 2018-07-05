
 //
//  SettingsVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var btnNotification:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK:- Actions
    @IBAction func actionBack(_ sender: Any) {
        
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
        
    }
    @IBAction func actionsNotificatione(_ sender:UIButton) {
        if sender.isSelected {
            btnNotification.setImage(#imageLiteral(resourceName: "ic_toggle_off"), for: .normal)
            sender.isSelected = false
        }else{
            btnNotification.setImage(#imageLiteral(resourceName: "ic_toggle_on"), for: .normal)
            sender.isSelected = true
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
