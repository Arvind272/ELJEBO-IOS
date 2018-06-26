//
//  ClientProfileVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class ClientProfileVM: NSObject {

}
extension ClientProfileView{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtUserName
        {
            txtUserName.resignFirstResponder()
            txtEmail.becomeFirstResponder()
        }
        if textField == txtEmail
        {
            txtEmail.resignFirstResponder()
            txtPhnNumber.becomeFirstResponder()
        }
        else if textField == txtPhnNumber
        {
            txtPhnNumber.resignFirstResponder()
            txtAddress1.becomeFirstResponder()
        }
        else
        {
            txtAddress1.resignFirstResponder()
        }
        
        return true
    }

}
