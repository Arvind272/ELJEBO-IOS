//
//  BookingPayVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class BookingPayVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var txtDuration: UITextField!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var tblServices: UITableView!
 @IBOutlet weak var tblVwHeightConstrt: NSLayoutConstraint!
    
   var selectedServicesArray:[(String,AnyObject)] = [("Cleaners","$20" as AnyObject),("Baby Sitters","$30" as AnyObject),("Plumbers & Electrician","$40" as AnyObject)]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblServices.register(UINib.init(nibName: "ServicesListTVC", bundle: nil), forCellReuseIdentifier:"ServicesListTVC")
        tblServices.reloadData()
        tblVwHeightConstrt.constant = CGFloat(35*selectedServicesArray.count)
        self.tblServices.register(UINib.init(nibName: "ServicesListTVC", bundle: nil), forCellReuseIdentifier:"ServicesListTVC")
        tblServices.reloadData()
        tblVwHeightConstrt.constant = CGFloat(35*selectedServicesArray.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionPayNow(_ sender: Any) {
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "TrackerVC", isAnimate: true, currentViewController: self)
    }
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
           Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "TrackerVC", isAnimate: true, currentViewController: self)
    }
   
}
