//
//  TrackerVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class TrackerVC: UIViewController ,UITableViewDataSource,UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    
    
    // MARK: - IBOUTLET
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblZipCode: UILabel!
    @IBOutlet weak var SErviceTime: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var tblSservices: UITableView!
    @IBOutlet weak var viewTimerStart: UIView!
    @IBOutlet weak var viewTimerEnd: UIView!
    @IBOutlet weak var btnTimerStart: UIButton!
     @IBOutlet weak var lblTimer: UILabel!
     @IBOutlet weak var lblExtraTimer: UILabel!
    @IBOutlet weak var btnTimerEnd: UIButton!
    @IBOutlet weak var colView: UICollectionView!
    @IBOutlet weak var tblVwHeightConstrt: NSLayoutConstraint!
    var currectTimeTaken = Int()
    var timer = Timer()
    var selectedServicesArray:[(String,AnyObject)] = [("Cleaners","$20" as AnyObject),("Baby Sitters","$30" as AnyObject),("Plumbers & Electrician","$40" as AnyObject)]
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTimerEnd.isHidden = true
        btnTimerEnd.isHidden = true
         lblExtraTimer.isHidden = true
        self.tblSservices.register(UINib.init(nibName: "ServicesListTVC", bundle: nil), forCellReuseIdentifier:"ServicesListTVC")
        tblSservices.reloadData()
        tblVwHeightConstrt.constant = CGFloat(35*selectedServicesArray.count)
        tblSservices.layoutIfNeeded()
        
        
    }
    
    @objc func update() {
        currectTimeTaken   += 1
        let hours = currectTimeTaken / 3600
        let minutes = (currectTimeTaken / 60) % 60
        let seconds = currectTimeTaken % 60
        lblTimer.text = "\(String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds))"
        if currectTimeTaken > 59 {
            lblExtraTimer.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionStartTracker(_ sender: Any) {
        
        
        
    }
    @IBAction func actionEndTracker(_ sender: Any) {
        
        timer.invalidate()
        
    }
    @IBAction func actionstart(_ sender: Any) {
       // currectTimeTaken = 0
        viewTimerEnd.isHidden = false
        viewTimerStart.isHidden = true
        btnTimerStart.isHidden = true
        btnTimerEnd.isHidden = false
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func actionTimerStop(_ sender: UIButton) {
       
        if sender.isSelected {
            // set deselected
            sender.isSelected = false
              self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            
        } else {
            // set selected
            sender.isSelected = true
            timer.invalidate()
             Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "TimerVC", isAnimate: true, currentViewController: self)
        }
       
    }
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    @IBAction func actionMessage(_ sender: Any) {
    }
    @IBAction func actionCall(_ sender: Any) {
    }
    @IBAction func actionVideoChat(_ sender: Any) {
    }
    
   
}
