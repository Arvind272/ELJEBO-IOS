//
//  DrawerVM.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit



class DrawerViewModel:NSObject {
    
    //Mark:- variable Decleration
    var serviceProviderArray:[(String,AnyObject)] = [("Profile",#imageLiteral(resourceName: "ic_profile_drawer")),("Notifications",#imageLiteral(resourceName: "ic_not_drawer")),("Settings",#imageLiteral(resourceName: "ic_set_drawer")),("Logout",#imageLiteral(resourceName: "ic_logout"))]
    var customerArray:[(String,AnyObject)] = [("Profile",#imageLiteral(resourceName: "ic_profile_drawer")),("Notifications",#imageLiteral(resourceName: "ic_not_drawer")),("Logout",#imageLiteral(resourceName: "ic_logout"))]
    var drawerType:UIStoryboard!
}

extension DrawerVC: UITableViewDelegate,UITableViewDataSource {
    
    //MARK:- Table View Delegate Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if drawerViewModelObj.drawerType == StoryboardType.customerStoryboard{
            return drawerViewModelObj.customerArray.count
        }else{
            return drawerViewModelObj.serviceProviderArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblViewDrawer.dequeueReusableCell(withIdentifier: "DrawerTVC", for: indexPath) as! DrawerTVC
        if drawerViewModelObj.drawerType == StoryboardType.customerStoryboard{
            cell.lblDrawerItem.text = drawerViewModelObj.customerArray[indexPath.row].0
            cell.imgViewDrawer.image = drawerViewModelObj.customerArray[indexPath.row].1 as? UIImage
           
        }else{
            cell.lblDrawerItem.text = drawerViewModelObj.serviceProviderArray[indexPath.row].0
            cell.imgViewDrawer.image = drawerViewModelObj.serviceProviderArray[indexPath.row].1 as? UIImage
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if drawerViewModelObj.drawerType == StoryboardType.serviceProviderStoryboard{
            switch indexPath.row {
            case 0:
                
                goToNextVC(indentifier: "ServicesProfileVC")
                break
            case 1:
                self.revealViewController().revealToggle(animated: true)
                
                goToNextVC(indentifier: "NotificationVC")
                break
            case 2:
                self.revealViewController().revealToggle(animated: true)
                goToNextVC(indentifier: "SettingsVC")
                break
            case 3:
                RootControllerProxy.shared.rootWithoutDrawer(StoryboardType.customerStoryboard, identifier: "WelcomeVC")
                
            default:
                break
            }
        }else{
            switch indexPath.row {
            case 0:
                 self.revealViewController().revealToggle(animated: true)
                goToCustNextVC(indentifier: "ClientProfileView")
                break
            case 1:
                self.revealViewController().revealToggle(animated: true)
                goToCustNextVC(indentifier: "NotificationVC")
                break
            case 2:
                RootControllerProxy.shared.rootWithoutDrawer(StoryboardType.customerStoryboard, identifier: "WelcomeVC")
                
                break
            default:
                break
            }
        }
        
    }
    
    func goToNextVC(indentifier:String)  {
        let view    = StoryboardType.serviceProviderStoryboard.instantiateViewController(withIdentifier: indentifier)
        let fnc = self.revealViewController().frontViewController as? UINavigationController
        fnc?.pushViewController(view, animated: true)
        self.revealViewController().setFrontViewPosition(.left, animated: true)
    }
    func goToCustNextVC(indentifier:String)  {
        let view    = StoryboardType.customerStoryboard.instantiateViewController(withIdentifier: indentifier)
        let fnc = self.revealViewController().frontViewController as? UINavigationController
        fnc?.pushViewController(view, animated: true)
        self.revealViewController().setFrontViewPosition(.left, animated: true)
    }
    
}


