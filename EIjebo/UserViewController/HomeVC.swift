//
//  HomeVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
import SWRevealViewController
class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate{
    // MARK: - IBOUTLET
    @IBOutlet weak var tblView: UITableView!
     @IBOutlet weak var txtSearch: UITextField!
   
    // MARK: - VARIABLE
      var selectedServicesArray = NSMutableArray()
    var objServicesVM = CommonServicesListViewModal()
    var selectedSection = Int()
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.register(UINib.init(nibName: "CheckListTVC", bundle: nil), forCellReuseIdentifier:"CheckListTVC")
        self.tblView.register(UINib.init(nibName: "HeaderTVC", bundle: nil), forCellReuseIdentifier:"HeaderTVC")
        selectedSection = -1
        objServicesVM.servicesListApi{
            self.tblView.reloadData()
        }
       
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        // MARK: - IBACTIONS
    @IBAction func buttonSideMenu(_ sender: UIButton) {
      
        self.revealViewController().revealToggle(animated: true)
    }
    @IBAction func buttonSearchServices(_ sender: UIButton) {
        print( self.selectedServicesArray)
        objServicesProviderListVM.service_id = selectedServicesArray.componentsJoined(by: ",")
        if self.selectedServicesArray.count > 0 {
            Proxy.shared.pushToNextVC(storyborad:StoryboardType.customerStoryboard, identifier: "ServicesProviderListVC", isAnimate: true, currentViewController: self)
        }else{
             Proxy.shared.displayStatusCodeAlert(AlertValue.selectService)
        }
     
    }
        
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
       
    
    @objc func tappedView ( _ sender : UITapGestureRecognizer ){
        
        if selectedSection == sender.view!.tag{
            selectedSection = -1
            
        } else {
            selectedSection = sender.view!.tag
            
        }
       tblView.reloadData()
    }
        
}
