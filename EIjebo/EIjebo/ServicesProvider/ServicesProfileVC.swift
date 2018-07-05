//
//  ServicesProfileVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class ServicesProfileVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var imgVwUserProfilePic: SetCornerImageView!
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    @IBAction func actionBack(_ sender: Any) {
        
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
        
    }
    @IBAction func actionPersonalInfo(_ sender: Any) {
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "PersonalInfoVC", isAnimate: true, currentViewController: self)
    }
    @IBAction func actionChnagePassword(_ sender: Any) {
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "ChangePassVC", isAnimate: true, currentViewController: self)
    }
    @IBAction func actionServices(_ sender: Any) {
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier:
            "ServicesVC" , isAnimate: true, currentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}

