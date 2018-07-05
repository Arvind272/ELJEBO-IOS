//
//  PersonalInfoVCVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class PersonalInfoVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtFldUserName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPhnNumber: UITextField!
    @IBOutlet weak var txtFldAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionBack(_ sender: Any) {
        
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
        
    }
    
    @IBAction func actionCheckIn(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtFldUserName
        {
            txtFldUserName.resignFirstResponder()
            txtFldEmail.becomeFirstResponder()
        }
        if textField == txtFldEmail
        {
            txtFldEmail.resignFirstResponder()
            txtFldPhnNumber.becomeFirstResponder()
        }
        else if textField == txtFldPhnNumber
        {
            txtFldPhnNumber.resignFirstResponder()
            txtFldAddress.becomeFirstResponder()
        }
        else
        {
            txtFldAddress.resignFirstResponder()
        }
        
        return true
    }
}
