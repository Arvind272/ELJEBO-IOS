//
//  AddCardDetailVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class AddCardDetailVM: NSObject {

}
extension AddCardsDetailsVC{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtFldCardName
        {
            txtFldCardName.resignFirstResponder()
            txtFldCardNumber.becomeFirstResponder()
        }
        if textField == txtFldCardNumber
        {
            txtFldCardNumber.resignFirstResponder()
            txtFldMonthYear.becomeFirstResponder()
        }
        else if textField == txtFldMonthYear
        {
            txtFldMonthYear.resignFirstResponder()
            txtFldCVV.becomeFirstResponder()
        }
        else
        {
            txtFldCVV.resignFirstResponder()
        }
        return true
    }
    //MARK:- TextField Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        //Range.Lenth will greater than 0 if user is deleting text - Allow it to replce
        if textField == txtFldMonthYear
        {
            if range.length > 0
            {
                return true
            }
            
            //Dont allow empty strings
            if string == " "
            {
                return false
            }
            
            //Check for max length including the spacers we added
            if range.location >= 5
            {
                return false
            }
            var originalText = textField.text
            //Put / space after 2 digit
            if range.location == 2
            {
                originalText?.append("/")
                textField.text = originalText
            }
        }
       
        if textField == txtFldCVV  {
            if range.location >= 3
            {
                return false
            }
        }
         if textField == txtFldCardNumber
        {
            if range.location >= 16
            {
                return false
            }
        }
        return true
    }

}
