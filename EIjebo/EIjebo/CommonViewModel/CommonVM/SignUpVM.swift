//
//  SignUpVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
 var objSignupVM = SignUpVM()
class SignUpVM: NSObject {
    var firstName,lastName,email,conEmail,userName,password,conPass,gender,country,address,address2,state,city,zipCode,phnNo,qus1,ans1,qus2,ans2,qus3,ans3,education,certificate,cardType,cardHolderName,cardNo,expMonth,expYear,cardCvv,latitute,longitute:String!
    var questionArr = NSArray()
    
    //MARK:- Signup Api Method
    func signupApi(_ completion:@escaping() -> Void) {
        var deviceTokken =  ""
        if UserDefaults.standard.object(forKey: "device_token") == nil {
            deviceTokken = "000000000000000000000000000000000000000000000000000000000000055"
        } else {
            deviceTokken = UserDefaults.standard.object(forKey: "device_token")! as! String
        }
        var qusetionsStr = String()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: questionArr, options: JSONSerialization.WritingOptions.prettyPrinted)
            qusetionsStr = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
            
        }catch let error as NSError{
            print(error.description)
        }
        
        let param = [
            "firstname" :firstName!,
            "lastname" :lastName!,
            "email":email!,
            "password":password,
            "username":userName!,
            "zip_code":zipCode!,
            "gender":gender!,
            "country_id":country!,
            "address":address!,
            "address2":address2!,
            "state_id":state!,
            "city_id":city!,
            "education":education!,
            "mobile":phnNo!,
            "UserCardDetail[type_id]":cardType!,
            "name_of_card":cardHolderName!,
            "card_number":cardNo!,
            "card_exp_date":"\(expMonth!)/\(expYear!)",
            "cvv":cardCvv,
            "security_que_ans":qusetionsStr,
            "latitude" : latitute!,
            "longitude":longitute!,
            "device_type":"2",
            "device_token":deviceTokken,
            "certificate_ids":certificate
            ] as [String:AnyObject]
        
        WebServiceProxy.shared.postData("http://103.15.67.74/eljebo/webservice/new/main/customerSignup", params: param, showIndicator: true, completion: { (JSON) in
            
            if JSON["status"] as! Int == 1 {
                
              Proxy.shared.displayStatusCodeAlert("Registered Successfully")
                if let auth = JSON["id"] as? String {
                    
                    UserDefaults.standard.set(auth, forKey: "user_id")
                    UserDefaults.standard.synchronize()
                }
                completion()
                
            } else {
                Proxy.shared.displayStatusCodeAlert(JSON["error"] as? String ?? "Error")
            }
        })
    }
    
}

extension SignUpVC {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtFirstName
        {
            txtFirstName.resignFirstResponder()
            txtLastName.becomeFirstResponder()
        }
        if textField == txtLastName
        {
            txtLastName.resignFirstResponder()
            txtEmail.becomeFirstResponder()
        }
        else if textField == txtEmail
        {
            txtEmail.resignFirstResponder()
            txtConfirmEmail.becomeFirstResponder()
        }
        else if textField == txtConfirmEmail
        {
            txtConfirmEmail.resignFirstResponder()
            txtUserName.becomeFirstResponder()
        }
        else if textField == txtUserName
        {
            txtUserName.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        }
        else if textField == txtPassword
        {
            txtPassword.resignFirstResponder()
            txtConfirmPassword.becomeFirstResponder()
        }
        else if textField == txtConfirmPassword
        {
            txtConfirmPassword.resignFirstResponder()
            txtCountry.becomeFirstResponder()
        }
            
            
        else if textField == txtCountry
        {
            txtCountry.resignFirstResponder()
            txtAddress1.becomeFirstResponder()
        }
        else if textField == txtAddress1
        {
            txtAddress1.resignFirstResponder()
            txtAddress2.becomeFirstResponder()
        }else  if textField == txtAddress2
        {
            txtAddress2.resignFirstResponder()
            txtCity.becomeFirstResponder()
        }
        if textField == txtCity
        {
            txtCity.resignFirstResponder()
            txtState.becomeFirstResponder()
        }
        else if textField == txtState
        {
            txtState.resignFirstResponder()
            txtZipCode.becomeFirstResponder()
        }
        else if textField == txtZipCode
        {
            txtZipCode.resignFirstResponder()
            txtPhnNumber.becomeFirstResponder()
        }
        else if textField == txtPhnNumber
        {
            txtPhnNumber.resignFirstResponder()
            txtQus1.becomeFirstResponder()
        }
        else if textField == txtQus1
        {
            txtQus1.resignFirstResponder()
            txtAns1.becomeFirstResponder()
        } else if textField == txtAns1
        {
            txtAns1.resignFirstResponder()
            txtQus2.becomeFirstResponder()
        }
        else if textField == txtQus2
        {
            txtQus2.resignFirstResponder()
            txtAns2.becomeFirstResponder()
        }
        else if textField == txtAns2
        {
            txtAns2.resignFirstResponder()
            txtQus3.becomeFirstResponder()
        }
        else if textField == txtQus3
        {
            txtQus3.resignFirstResponder()
            txtAns3.becomeFirstResponder()
        }
        else if textField == txtAns3
        {
            txtAns3.resignFirstResponder()
            txtCerticate.becomeFirstResponder()
        }
        else
        {
            txtCerticate.resignFirstResponder()
        }
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case txtCountry:
            self.view.endEditing(true)
        case txtState:
            self.view.endEditing(true)
        case txtCity:
            self.view.endEditing(true)
        default:
            break
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case txtCountry:
            let presentControllerObj = StoryboardType.customerStoryboard.instantiateViewController(withIdentifier: "AddressListVC")as! AddressListVC
            objDefaultVal.isAdressList = "country"
             self.navigationController?.present(presentControllerObj, animated: true, completion: nil)
        case txtState:
               let presentControllerObj = StoryboardType.customerStoryboard.instantiateViewController(withIdentifier: "AddressListVC")as! AddressListVC
             objDefaultVal.isAdressList = "state"
          presentControllerObj.objAddressModel.id = objAddress.id
              self.navigationController?.present(presentControllerObj, animated: true, completion: nil)
        case txtCity:
              let presentControllerObj = StoryboardType.customerStoryboard.instantiateViewController(withIdentifier: "AddressListVC")as! AddressListVC
             objDefaultVal.isAdressList = "city"
             presentControllerObj.objAddressModel.id = objAddress.id
              self.navigationController?.present(presentControllerObj, animated: true, completion: nil)
        default:
            break
        }
        
        return true
    }
}
