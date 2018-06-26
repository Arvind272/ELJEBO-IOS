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
    var listArray = ["Merry Thomas","Smith Thomas","Tom Craft","Jack Neo","John Thomas"]
    // MARK: - LIFECYCLE
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.register(UINib.init(nibName: "ServicesProviderTVC", bundle: nil), forCellReuseIdentifier:"ServicesProviderTVC")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - IBACTIONS
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
   
   
}
