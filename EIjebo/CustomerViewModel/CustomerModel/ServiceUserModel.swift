//
//  ServiceUserModel.swift
//  EIjebo
//
//  Created by samosys on 7/6/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class ServiceUserModel: NSObject {
    
        
    var serviceusername,serviceuserid,serviceuserimageurl,time,adderess,descriptionstr,timeing ,latitude,longitude,country_name,city_name,address2,mobile : String!
    var arrserviceData  = [SubServiceModel]()
  
    func ServiceUserModelList(_ dict:NSDictionary) {
            
            if let idVal  = dict["user_id"] as? String{
                if idVal != ""
                {
                    serviceuserid = idVal
                }else{
                    serviceuserid = "0"
                }
            } else if let idVal  = dict["user_id"] as? Int{
                serviceuserid = "\(idVal)"
            }
            //stateId = dict["state_id"]! as? Int ?? 0
            //  typeID = dict["type_id"]! as? Int ?? 0
            serviceusername = dict["name"]! as? String ?? ""
            serviceuserimageurl = dict["profile_pic"]! as? String ?? ""
            timeing = dict["start_time"]! as? String ?? ""
            latitude = dict["latitude"]! as? String ?? ""
            longitude = dict["longitude"]! as? String ?? ""
          //  country_name = dict["country_name"]! as? String ?? ""
            city_name   = dict["city_name"]! as? String ?? ""
            address2 = dict["address2"]! as? String ?? ""
            mobile = dict["mobile"]! as? String ?? ""
            descriptionstr = dict["country_name"]! as? String ?? ""
        }
    }

