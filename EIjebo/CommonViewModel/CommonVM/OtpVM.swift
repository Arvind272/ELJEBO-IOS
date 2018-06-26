//
//  OtpVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class OtpVM: NSObject {

}
extension OtpCodeVC {

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtCode
        {
            txtCode.resignFirstResponder()
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits)) != nil) {
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 6
        }
        else{
            return true
        }
    }
    
}
