//
//  ServiceProviderListModel.swift
//  EIjebo
//
//  Created by user on 05/07/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class ServiceProviderListModel: NSObject {
    
    var name,id, userId,imageurl : String!
   
    
    
    func serviceProviderList(_ dict:NSDictionary) {
        
        if let idVal  = dict["user_id"] as? String{
            if idVal != ""
            {
                id = idVal
            }else{
                id = "0"
            }
        } else if let idVal  = dict["user_id"] as? Int{
            id = "\(idVal)"
        }
        //stateId = dict["state_id"]! as? Int ?? 0
        //  typeID = dict["type_id"]! as? Int ?? 0
        name = dict["name"]! as? String ?? ""
        imageurl = dict["profile_pic"]! as? String ?? ""
  
    }
}
