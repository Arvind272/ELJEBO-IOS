//
//  LoginVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
var objLoginVM = LoginVM()
class LoginVM: NSObject {
       var userName,password,user_type:String!
    
    func loginApi(_ completion:@escaping() -> Void) {
        var deviceTokken =  ""
        if UserDefaults.standard.object(forKey: "device_token") == nil {
            deviceTokken = "000000000000000000000000000000000000000000000000000000000000055"
        } else {
            deviceTokken = UserDefaults.standard.object(forKey: "device_token")! as! String
        }
       
        let param = [
            "password":password!,
            "username":userName!,
            "device_type":"1",
            "device_token":deviceTokken,
            "user_type":user_type,
            ] as [String:AnyObject]
        
        WebServiceProxy.shared.postData("http://103.15.67.74/eljebo/webservice/new/main/login", params: param, showIndicator: true, completion: { (JSON) in
            if JSON["status"] as! Int == 1 {
                Proxy.shared.displayStatusCodeAlert("Login Successfully")
                if let auth = JSON["auth_code"] as? String {
                    UserDefaults.standard.set(auth, forKey: "auth_code")
                    UserDefaults.standard.synchronize()
                }
                completion()
                
            } else {
                Proxy.shared.displayStatusCodeAlert(JSON["message"] as? String ?? "Error")
            }
        })
    }
    
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
