//
//  ClientProfileView.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit


class ClientProfileView: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtAddress1: UITextField!
    @IBOutlet weak var txtPhnNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionPassword(_ sender: Any) {
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier:"ChangePassVC", isAnimate: true, currentViewController: self)
    }
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
   
}
