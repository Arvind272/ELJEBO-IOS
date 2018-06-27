//
//  CommonServicesListViewModal.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class CommonServicesListViewModal: NSObject {
    var servicesListArr = [CommonServiceListModel]()
    
    func servicesListApi(_ completion:@escaping() -> Void) {
        WebServiceProxy.shared.getData("http://103.15.67.74/eljebo/webservice/new/main/getServiceList", showIndicator: true, completion: { (JSON) in
            if JSON["status"] as! Int == 1 {
                if let countryArr = JSON["data"] as? NSArray
                {
                    for i in 0..<countryArr.count{
                        let dictItem = countryArr.object(at: i) as! NSDictionary
                        let objServices = CommonServiceListModel()
                        objServices.servicesList(dictItem)
                        self.servicesListArr.append(objServices)
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

