//
//  LoginVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class LoginVM: NSObject {

}
extension LoginVC{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtUserName
        {
            txtUserName.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        }
        else{
            txtPassword.resignFirstResponder()
        }
        return true
    }
}
