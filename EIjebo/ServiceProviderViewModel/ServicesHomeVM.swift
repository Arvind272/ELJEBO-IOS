//
//  ServicesHomeVM.swift
//  Tawseleh
//
//  Created by Nikita Kalra on 22/03/18.
//  Copyright © 2018 Pushpinder Kaur. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import GooglePlaces

class ServicesTVC: UITableViewCell {
    @IBOutlet weak var lblServiceTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
}
class ServicesHomeVM: NSObject {
    var addressCountForPickup = Int()
    var servicesArray = ["Cleaners","Baby Sitters", "Plumbers & Electrician"]
}

extension ServicesHomeVC: UITextFieldDelegate {
    
    //MARK:- Textfield delegates
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    //MARK:- Map Methods
    
    func mapView(_ mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool {
        return true
    }
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let showView = Bundle.main.loadNibNamed("ShowNameAndImage", owner: self, options: nil)?.first as! ShowNameAndImage
        
        return showView
    }
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        showScheduleData()
    }
    
    
    func showScheduleData()  {
        
        UIView.animate(withDuration: 1, delay: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.heightConstrtAcceptRejectVw.constant = 300
            self.view.layoutIfNeeded()
        }, completion:{ finish in
        })
    }
    func hideScheduleData()  {
        
        UIView.animate(withDuration: 1, delay: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.heightConstrtAcceptRejectVw.constant = 0
            self.view.layoutIfNeeded()
        }, completion:{ finish in
        })
    }
    
}
extension ServicesHomeVC:UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceHomeMdVw.servicesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblServices.dequeueReusableCell(withIdentifier: "ServicesTVC") as! ServicesTVC
        cell.lblServiceTitle.text = serviceHomeMdVw.servicesArray[indexPath.row]
        cell.lblPrice.text = "$20.5"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}

