//
//  ChangePassVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class ChangePassVM: NSObject {

}
extension ChangePassVC{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtFldCurrentPswrd
        {
            txtFldCurrentPswrd.resignFirstResponder()
            txtFldConfirmPswrd.becomeFirstResponder()
        }
            
        else
        {
            txtFldConfirmPswrd.resignFirstResponder()
        }
        
        return true
    }
}
