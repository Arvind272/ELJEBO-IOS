//
//  AddressListVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 16/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class AddressListVM: NSObject {
    
    var addressArr = [AddressModel]()
    var page,totalPage : Int!
    var id = String()
    
    func countryListApi(_ completion:@escaping() -> Void) {
        WebServiceProxy.shared.getData("\(Apis.KServerUrl)\(Apis.KCountryList)", showIndicator: true, completion: { (JSON) in
            if JSON["status"] as! Int == 200 {
                if let countryArr = JSON["data"] as? NSArray
                {
                    for i in 0..<countryArr.count{
                        let dictItem = countryArr.object(at: i) as! NSDictionary
                        let objAddress = AddressModel()
                        objAddress.countryList( dictItem)
                        self.addressArr.append(objAddress)
                    }
                }
                completion()
            }
            else {
                Proxy.shared.displayStatusCodeAlert(JSON["error"] as? String ?? "Error")
            }
        })
    }
    func stateListApi(_ completion:@escaping() -> Void) {
        WebServiceProxy.shared.getData("\(Apis.KServerUrl)\(Apis.KStateList)\(id)", showIndicator: true, completion: { (JSON) in
            if JSON["status"] as! Int == 200 {
                if let countryArr = JSON["data"] as? NSArray
                {
                    for i in 0..<countryArr.count{
                        let dictItem = countryArr.object(at: i) as! NSDictionary
                        let objAddress = AddressModel()
                        objAddress.countryList( dictItem)
                        self.addressArr.append(objAddress)
                    }
                }
                completion()
            }
            else {
                Proxy.shared.displayStatusCodeAlert(JSON["error"] as? String ?? "Error")
            }
        })
    }
    func cityListApi(_ completion:@escaping() -> Void) {
        WebServiceProxy.shared.getData("\(Apis.KServerUrl)\(Apis.KCityList)\(id)", showIndicator: true, completion: { (JSON) in
            if JSON["status"] as! Int == 200 {
                if let countryArr = JSON["data"] as? NSArray
                {
                    for i in 0..<countryArr.count{
                        let dictItem = countryArr.object(at: i) as! NSDictionary
                        let objAddress = AddressModel()
                        objAddress.countryList( dictItem)
                        self.addressArr.append(objAddress)
                    }
                }
                completion()
            }
            else {
                Proxy.shared.displayStatusCodeAlert(JSON["error"] as? String ?? "Error")
            }
        })
    }
    
}
extension AddressListVC : UITableViewDelegate, UITableViewDataSource{
    
    // MARK : TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objAddressModel.addressArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        let dict = objAddressModel.addressArr[indexPath.row]
        cell.textLabel?.text = dict.title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name("selectAddress"), object: self.objAddressModel.addressArr[indexPath.row])
        }
    }
    
}
