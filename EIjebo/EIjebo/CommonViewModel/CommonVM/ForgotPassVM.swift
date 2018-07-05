//
//  ForgotPassVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class ForgotPassVM: NSObject {

}
extension ForgotPassVC{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtEmail
        {
            txtEmail.resignFirstResponder()
            txtQuestions1.becomeFirstResponder()
        }
        if textField == txtQuestions1
        {
            txtQuestions1.resignFirstResponder()
            txtAns1.becomeFirstResponder()
        }
        else if textField == txtAns1
        {
            txtAns1.resignFirstResponder()
            txtQuestions2.becomeFirstResponder()
        }
        else if textField == txtQuestions2
        {
            txtQuestions2.resignFirstResponder()
            txtAns2.becomeFirstResponder()
        }
        else if textField == txtAns2
        {
            txtAns2.resignFirstResponder()
            txtQuestions3.becomeFirstResponder()
        }
        else if textField == txtQuestions3
        {
            txtQuestions3.resignFirstResponder()
            txtAns3.becomeFirstResponder()
        }else{
            txtAns3.resignFirstResponder()
        }
        return true
    }
    

}
