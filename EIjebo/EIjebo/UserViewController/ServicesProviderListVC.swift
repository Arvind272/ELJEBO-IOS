//
//  ServicesProviderListVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class ServicesProviderListVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
        
    // MARK: - IBOUTLET
       @IBOutlet weak var tblView: UITableView!
    // MARK: - VARIABLE
    var objServicesProviderListVM = ServicesProviderListVM()
    // MARK: - LIFECYCLE
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblView.register(UINib.init(nibName: "ServicesProviderTVC", bundle: nil), forCellReuseIdentifier:"ServicesProviderTVC")
        let user_id = UserDefaults.standard.value(forKey: "user_id") as? String
        objServicesProviderListVM.userId = user_id!
        objServicesProviderListVM.service_id = "10"
        objServicesProviderListVM.serviceProviderListApi{
                self.tblView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - IBACTIONS
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
   
   
}
