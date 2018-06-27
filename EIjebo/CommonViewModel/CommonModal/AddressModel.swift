//
//  AddressModel.swift
//  EIjebo
//
//  Created by Ankita Thakur on 16/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class AddressModel: NSObject {
    var stateId,typeID : Int!
    var title,id : String!
    func countryList(_ dict:NSDictionary)   {
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
        //stateId = dict["state_id"]! as? Int ?? 0
      //  typeID = dict["type_id"]! as? Int ?? 0
        title = dict["name"]! as? String ?? ""
  }
}
