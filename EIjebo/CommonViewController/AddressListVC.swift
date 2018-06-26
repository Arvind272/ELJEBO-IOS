//
//  AddressListVC.swift
//  EIjebo
//
//  Created by Ankita Thakur on 16/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class AddressListVC: UIViewController,UIGestureRecognizerDelegate {
    // MARK :- IBOUTLET
    @IBOutlet var tblView : UITableView!
    @IBOutlet var search : UISearchBar!
     // MARK :- Variable
   var objAddressModel = AddressListVM()
    
     // MARK :- IBOUTLET
    override func viewDidLoad() {
        super.viewDidLoad()
        if objDefaultVal.isAdressList == "country"{
            objAddressModel.countryListApi {
                self.tblView.reloadData()
            }
        }
        if objDefaultVal.isAdressList == "state"{
            objAddressModel.stateListApi {
                self.tblView.reloadData()
                
            }
        }
        if objDefaultVal.isAdressList == "city"{
            objAddressModel.cityListApi {
                self.tblView.reloadData()
            }
        }
        tblView.tableFooterView = UIView()

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
     // MARK :- IBOUTLET
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}
