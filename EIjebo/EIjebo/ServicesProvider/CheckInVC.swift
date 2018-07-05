//
//  CheckInVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class CheckInVC: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblZipCode: UILabel!
    @IBOutlet weak var SErviceTime: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var tblSservices: UITableView!
    @IBOutlet weak var tblVwHeightConstrt: NSLayoutConstraint!
     @IBOutlet weak var btnTimerStart: UIButton!
     @IBOutlet weak var lblTimerStart: UILabel!
    
    //MARK:- Model Class Object
    var acceptModelViewObj = AcceptModelView()
    var timer = Timer()
    var currectTimeTaken = Int()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
         tblSservices.reloadData()
      tblVwHeightConstrt.constant = CGFloat(35*acceptModelViewObj.servicesArray.count)
        tblSservices.layoutIfNeeded()
        // Do any additional setup after loading the view.
    }
    @objc func update() {
        currectTimeTaken   += 1
        let hours = currectTimeTaken / 3600
        let minutes = (currectTimeTaken / 60) % 60
        let seconds = currectTimeTaken % 60
        lblTimerStart.text = "\(String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds))"
    }
    //MARK:- Actions
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    @IBAction func actionCheckinTimer(_ sender: Any) {
        timer.invalidate()
        currectTimeTaken = 0
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "FeedBackVC", isAnimate: true, currentViewController: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension CheckInVC:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acceptModelViewObj.servicesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSservices.dequeueReusableCell(withIdentifier: "AcceprRejectTVC") as! AcceprRejectTVC
        cell.lblServiceTitle.text = acceptModelViewObj.servicesArray[indexPath.row]
        cell.lblPrice.text = "$20.5"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}
