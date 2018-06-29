//
//  OtpVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
 var objOtpVM = OtpVM()
class OtpVM: NSObject {
    var otp,userId:String!
    func otpVerifyApi(_ completion:@escaping() -> Void) {
      
        let param = [
            "userId":userId!,
            "otp":otp!,
             ] as [String:AnyObject]
        
        WebServiceProxy.shared.postData("http://103.15.67.74/eljebo/webservice/new/main/verifyOtp", params: param, showIndicator: true, completion: { (JSON) in
            if JSON["status"] as! Int == 1 {
                Proxy.shared.displayStatusCodeAlert("Welcome in eljibo..")
              
                completion()
                
            } else {
                Proxy.shared.displayStatusCodeAlert(JSON["message"] as? String ?? "Error")
            }
        })
    }
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
