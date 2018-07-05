//
//  ServicesHomeVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
import SWRevealViewController
import GoogleMaps
import GooglePlaces

class ServicesHomeVC: UIViewController,GMSMapViewDelegate,handleDrawerNavigation {
    
    //MARK:- Outlets
    @IBOutlet weak var heightConstrtAcceptRejectVw: NSLayoutConstraint!
    @IBOutlet weak var mapVwHome: GMSMapView!
    @IBOutlet weak var tblServices: UITableView!
    
    @IBOutlet weak var btnDrawer: UIButton!
    // MARK: - VARIABLE
    var serviceHomeMdVw = ServicesHomeVM()
    var tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        protocolDrawerNav = self
        self.heightConstrtAcceptRejectVw.constant = 0
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        mapVwHome.delegate = self
        Proxy.shared.setDefaultLocation(mapView: mapVwHome)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionDrawer(_ sender: Any) {
        self.revealViewController().revealToggle(animated: true)
        hideScheduleData()
    }
    @IBAction func actionAccept(_ sender: Any) {
        hideScheduleData()
                Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "AcceptedAndRejectedVC", isAnimate: true, currentViewController: self)
        
        
    }
    @IBAction func actionReject(_ sender: Any) {
        hideScheduleData()
    }
    func dismissDrawer() {
        if self.revealViewController() != nil  {
            mapVwHome.isUserInteractionEnabled = true
            KAppDelegate.window?.removeGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.removeGestureRecognizer(self.tapGesture)
        }
    }
    
    func openDrawer() {
        if self.revealViewController() != nil  {
            mapVwHome.isUserInteractionEnabled = false
            KAppDelegate.window?.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideTheDrawerOnTap))
            tapGesture.numberOfTapsRequired = 1
            KAppDelegate.window?.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.tapGesture)
        }
    }
    
    @objc func hideTheDrawerOnTap() {
        if self.revealViewController() != nil  {
            mapVwHome.isUserInteractionEnabled = true
            KAppDelegate.window?.removeGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().revealToggle(animated: true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideScheduleData()
    }
}
