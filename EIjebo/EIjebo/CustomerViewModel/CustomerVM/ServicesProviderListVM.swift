//
//  ServicesProviderListVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
 var objServicesProviderListVM = ServicesProviderListVM()
class ServicesProviderListVM: NSObject {

    var listArr = [ServiceProviderListModel]()
    var service_id = String()
    var userId = String()
    
    func serviceProviderListApi(_ completion:@escaping() -> Void) {
        
        var Tokken =  ""
        if UserDefaults.standard.object(forKey: "token") == nil {
            Tokken = "000000000000000000000000000000000000000000000000000000000000055"
        } else {
            Tokken = UserDefaults.standard.object(forKey: "token")! as! String
        }
        
        let param = [
            "user_id":userId,
            "token":Tokken,
            "service_ids":service_id
            ] as [String:AnyObject]
        
        WebServiceProxy.shared.postData("http://103.15.67.74/eljebo/webservice/new/main/serviceProviderList", params: param, showIndicator: true, completion: { (JSON) in
            
            if JSON["status"] as! Int == 1 {
                if let countryArr = JSON["data"] as? NSArray
                {
                    for i in 0..<countryArr.count{
                        let dictItem = countryArr.object(at: i) as! NSDictionary
                        let objAddress = ServiceProviderListModel()
                        objAddress.serviceProviderList(dictItem)
                        self.listArr.append(objAddress)
                    }
                }
                  
                completion()
            } else {
                Proxy.shared.displayStatusCodeAlert(JSON["message"] as? String ?? "Error")
            }
        })
    }
    
}
extension ServicesProviderListVC{
    // MARK : TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objServicesProviderListVM.listArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesProviderTVC") as! ServicesProviderTVC
        
        let dict = self.objServicesProviderListVM.listArr[indexPath.row]
        cell.lblUserName?.text = dict.name
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "ServicesUserVC", isAnimate: true, currentViewController: self)
    }
    
}
