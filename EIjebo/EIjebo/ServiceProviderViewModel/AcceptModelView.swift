//
//  AcceptModelView.swift
//  
//
//  Created by Sapna Bansal on 13/06/18.
//

import UIKit
import Foundation
class AcceprRejectTVC: UITableViewCell {
    @IBOutlet weak var lblServiceTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
}
class AcceptModelView: NSObject {
    var servicesArray = ["Cleaners","Baby Sitters", "Plumbers & Electrician"]
}

extension AcceptedAndRejectedVC:UITableViewDelegate , UITableViewDataSource{
    
    // MARK : TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedServicesArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesListTVC") as! ServicesListTVC
        cell.textLabel?.text = selectedServicesArray[indexPath.row].0
        cell.detailTextLabel?.text = "\(selectedServicesArray[indexPath.row].1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
