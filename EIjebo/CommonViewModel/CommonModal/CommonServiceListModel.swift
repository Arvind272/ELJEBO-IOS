//
//  CommonServiceListModel.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class CommonServiceListModel: NSObject {
    var id,title,price : String!
    var stateId,typeId : Int!
    var subServicesArr = [SubServiceModel]()
    func servicesList(_ dict:NSDictionary)   {
        if let idVal  = dict["id"] as? String{
            if idVal != ""
            {
                id = idVal
            }else{
                id = "0"
            }
        }else if let idVal  = dict["id"] as? Int{
            id = "\(idVal)"
        }
        
        
        stateId = dict["state_id"]! as? Int ?? 0
        typeId = dict["type_id"]! as? Int ?? 0
        title = dict["title"]! as? String ?? ""
        if let subArr = dict["subServices"] as? NSArray
        {
            for i in 0..<subArr.count{
                let dictItem = subArr.object(at: i) as! NSDictionary
                let objSubList = SubServiceModel()
                objSubList.subServicesList(dictItem)
                self.subServicesArr.append(objSubList)
            }
        }
    }
}
class SubServiceModel: NSObject {
    var id,servicesId,title : String!
    var stateId,typeId : Int!
    func subServicesList(_ dict:NSDictionary)   {
        if let idVal  = dict["id"] as? String{
            if idVal != ""
            {
                id = idVal
            }else{
                id = "0"
            }
        }else if let idVal  = dict["id"] as? Int{
            id = "\(idVal)"
        }
        if let idVal  = dict["service_id"] as? String{
            if idVal != ""
            {
                servicesId = idVal
            }else{
                servicesId = "0"
            }
        }else if let idVal  = dict["service_id"] as? Int{
            servicesId = "\(idVal)"
        }
        stateId = dict["state_id"]! as? Int ?? 0
        typeId = dict["type_id"]! as? Int ?? 0
        title = dict["title"]! as? String ?? ""
    }
}

