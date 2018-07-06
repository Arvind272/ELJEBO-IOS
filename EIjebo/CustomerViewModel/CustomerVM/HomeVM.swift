//
//  HomeVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 15/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class HomeVM: NSObject {

}
extension HomeVC{
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
            let value = subCatDict.id!
            if selectedServicesArray.contains(value) {
                cell.btnSelect.isSelected = true
            }
            else{
                cell.btnSelect.isSelected = false
            }
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let sec = objServicesVM.servicesListArr[selectedSection]
        let subCatDict = sec.subServicesArr[indexPath.row]
        let value = subCatDict.id!
        if selectedServicesArray.contains(value) {
            selectedServicesArray.remove(value)
        }
        else{
            selectedServicesArray.add(value)
        }
        tblView.reloadData()
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
        headerView.lblTitle.text = servicesDict.title
        if selectedSection == section {
            headerView.btnSelected.setImage(#imageLiteral(resourceName: "ic_uparw") ,for: . normal)
            
        }else{
            
            headerView.btnSelected.setImage(#imageLiteral(resourceName: "ic_dropdown"),for: . normal)
        }
        
        return headerView
    }
}
