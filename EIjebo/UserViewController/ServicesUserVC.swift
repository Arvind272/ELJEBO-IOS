//
//  ServicesUserVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
class ServicesUserVC: UIViewController, GMSMapViewDelegate,handleDrawerNavigation , UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var mapVwHome: GMSMapView!
    @IBOutlet weak var txtDuration: UITextField!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var tblServices: UITableView!
    @IBOutlet weak var lblAvailability: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgProfile: SetCornerImageView!
    @IBOutlet weak var lblName: UILabel!
 @IBOutlet weak var tblVwHeightConstrt: NSLayoutConstraint!
    var timePicker = UIDatePicker()
    
   var selectedServicesArray:[(String,AnyObject)] = [("Cleaners","$20" as AnyObject),("Baby Sitters","$30" as AnyObject),("Plumbers & Electrician","$40" as AnyObject)]
    override func viewDidLoad() {
        super.viewDidLoad()
        mapVwHome.delegate = self
        Proxy.shared.setDefaultLocation(mapView: mapVwHome)
        timePicker.datePickerMode = .time
        txtTime.inputView = timePicker
        timePicker.minimumDate = Date()
        txtDate.inputView = timePicker
        self.tblServices.register(UINib.init(nibName: "ServicesListTVC", bundle: nil), forCellReuseIdentifier:"ServicesListTVC")
        tblServices.reloadData()
        tblVwHeightConstrt.constant = CGFloat(35*selectedServicesArray.count)
        let user_id = UserDefaults.standard.value(forKey: "user_id") as? String
        objServicesUserVM.userId = user_id!
//        objServicesUserVM.serviceProviderDetailsApi {
//            let dic = objServicesUserVM.serviceUserModelArr[0]
//            self.lblName.text = dic.serviceusername
//        }
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionBookNow(_ sender: Any) {
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "BookingPayVC", isAnimate: true, currentViewController: self)
    }
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
   
}
