//
//  ServicesVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
class ServicesVC: UIViewController,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate{
    // MARK: - IBOUTLET
    @IBOutlet weak var tblView: UITableView!
    // MARK: - VARIABLE
    var selectedSection = Int()
    var objServicesVM = CommonServicesListViewModal()
    // MARK: - LIFECYCLE
    var selectedServicesArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedSection = -1
        self.tblView.register(UINib.init(nibName: "CheckListTVC", bundle: nil), forCellReuseIdentifier:"CheckListTVC")
        self.tblView.register(UINib.init(nibName: "HeaderTVC", bundle: nil), forCellReuseIdentifier:"HeaderTVC")
        objServicesVM.servicesListApi{
            self.tblView.reloadData()
        }
    }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)

    }
    // MARK: - IBACTIONS
      
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
        // MARK : TABLEVIEW
        func numberOfSections(in tableView: UITableView) -> Int {
            return objServicesVM.servicesListArr.count
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            if selectedSection == section {
               return objServicesVM.servicesListArr[selectedSection].subServicesArr.count
            }
            else{
                return 0
            }
           
        }
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 45
            
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           
        return 35
            }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListTVC") as! CheckListTVC
            cell.btnSelect.tag = indexPath.row
            let sec = objServicesVM.servicesListArr[indexPath.section]
            let subCatDict = sec.subServicesArr[indexPath.row]
            cell.lblTitle.text = subCatDict.title!
            cell.btnSelect.isUserInteractionEnabled = false
            if objServicesVM.servicesListArr.count != 0 {
                let secServices = objServicesVM.servicesListArr[selectedSection]
                let subCatDict  = secServices.subServicesArr[indexPath.row]
                let value = subCatDict.title!
            
                if selectedServicesArray.contains(value) {
                    cell.btnSelect.isSelected = true
                }
                else{
                    cell.btnSelect.isSelected = false
                }
            }
          //  cell.btnSelect.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
                return cell
            
            }
       
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = tableView.dequeueReusableCell(withIdentifier: "HeaderTVC") as! HeaderTVC
            headerView.tag = section
            
            headerView.tag = section
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedView(_:)))
            tapGesture.delegate = self
            tapGesture.numberOfTapsRequired = 1
            tapGesture.numberOfTouchesRequired = 1
            headerView.addGestureRecognizer(tapGesture)
            let servicesDict = objServicesVM.servicesListArr[section]
            headerView.lblTitle.text = servicesDict.title!
            
            if selectedSection == section {
                headerView.btnSelected.setImage(#imageLiteral(resourceName: "ic_dropdown"),for: . normal)
                
            }else{
                headerView.btnSelected.setImage(#imageLiteral(resourceName: "ic_uparw") ,for: . normal)
            }
        
            return headerView
        }
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let sec = objServicesVM.servicesListArr[selectedSection]
        let subCatDict = sec.subServicesArr[indexPath.row]
        let value = subCatDict.title!
        if selectedServicesArray.contains(value) {
            selectedServicesArray.remove(value)
        }
        else{
            selectedServicesArray.add(value)
        }
        tblView.reloadData()
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
