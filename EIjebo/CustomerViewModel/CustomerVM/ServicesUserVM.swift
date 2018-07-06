//
//  ServicesUserVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
 var objServicesUserVM = ServicesUserVM()
class ServicesUserVM: NSObject {

    var serviceUserModelArr = [ServiceUserModel]()
    var userId = String()
    var service_provider_id = String()
    func serviceProviderDetailsApi(_ completion:@escaping() -> Void) {
        
        var Tokken =  ""
        if UserDefaults.standard.object(forKey: "token") == nil {
            Tokken = "000000000000000000000000000000000000000000000000000000000000055"
        } else {
            Tokken = UserDefaults.standard.object(forKey: "token")! as! String
        }
        
        let param = [
            "user_id":userId,
            "token":Tokken,
            "service_provider_id":service_provider_id
            ] as [String:AnyObject]
        
        WebServiceProxy.shared.postData("http://103.15.67.74/eljebo/webservice/new/main/getServiceProviderProfile", params: param, showIndicator: true, completion: { (JSON) in
            
            if JSON["status"] as! Int == 1 {
                if let dictItem = JSON["data"] as? NSDictionary
                {
                    let objAddress = ServiceUserModel()
                    objAddress.ServiceUserModelList(dictItem)
                    self.serviceUserModelArr.append(objAddress)
                    
                }
                
                completion()
            } else {
                Proxy.shared.displayStatusCodeAlert(JSON["message"] as? String ?? "Error")
            }
        })
    }
    
}

extension ServicesUserVC{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtDate
        {
            txtDate.resignFirstResponder()
            txtTime.becomeFirstResponder()
        }
        if textField == txtTime
        {
            txtTime.resignFirstResponder()
            txtDuration.becomeFirstResponder()
        }
        else{
            txtDuration.resignFirstResponder()
        }
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case txtDate:
            timePicker.minimumDate = Date()
            timePicker.datePickerMode = .date
            
            txtDate.text = Proxy.shared.getStringFrmDate(getDate: timePicker.date, format: "yyyy-MM-dd")
            timePicker.tag = 1
            timePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
        case txtTime :
            if txtDate.text != ""{
                timePicker.minimumDate = Date()
                timePicker.datePickerMode = .time
                txtTime.text = Proxy.shared.getStringFrmDate(getDate: timePicker.date, format: "hh:mm")
                timePicker.tag = 2
                timePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
            }else{
                Proxy.shared.displayStatusCodeAlert("Please Enter To Time first")
            }
        default:
            break
        }
        return true
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        switch sender.tag {
        case 1:
            txtDate.text = Proxy.shared.getStringFrmDate(getDate: sender.date, format: "yyyy-MM-dd")
        case 2:
            txtTime.text = Proxy.shared.getStringFrmDate(getDate: sender.date, format: "hh:mm")
        default:
            break
        }
    }
    // MARK : TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedServicesArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesListTVC") as! ServicesListTVC
        cell.textLabel?.text = selectedServicesArray[indexPath.row].0
        cell.detailTextLabel?.text = "\(selectedServicesArray[indexPath.row].1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
