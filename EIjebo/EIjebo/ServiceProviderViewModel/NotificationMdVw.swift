//
//  NotificationMdVw.swift
//  Eljebo
//
//  Created by Sapna Bansal on 11/06/18.
//  Copyright © 2018 Sapna Bansal. All rights reserved.
//

import UIKit
import Foundation
class NotificationTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTimeDuration: UILabel!
    @IBOutlet weak var lblDay: UILabel!


}
class NotificationMdVw: NSObject {
  var notificationArray = ["Cleaners","Baby Sitters", "Plumber & Electrician"]
}

extension NotificationsVC:UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//acceptRejectServiceMdVwObj.notificationArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwNotification.dequeueReusableCell(withIdentifier: "NotificationTVC") as! NotificationTVC
//        cell.lblServiceTitle.text = acceptRejectServiceMdVwObj.servicesArray[indexPath.row]
//         cell.lblPrice.text = "$20.5"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
