//
//  NotificationVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    // MARK: - IBOUTLET
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tblVwNotification: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
self.tblView.register(UINib.init(nibName: "NotificationTVC", bundle: nil), forCellReuseIdentifier:"NotificationTVC")
    }
    
    //MARK:- Actions
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
        
   
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}
