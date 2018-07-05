//
//  DrawersVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
import SDWebImage
@objc protocol handleDrawerNavigation {
    @objc optional func dismissDrawer()
    @objc optional func openDrawer()
}
var protocolDrawerNav : handleDrawerNavigation?

class DrawerVC: UIViewController,UIGestureRecognizerDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var tblViewDrawer: UITableView!
    @IBOutlet weak var imgViewProfilePic: UIImageView!
    @IBOutlet weak var lblPassengerName: UILabel!
    @IBOutlet weak var btnViewProfile: UIButton!
    
    var drawerViewModelObj = DrawerViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewDrawer.tableFooterView = UIView()
        drawerViewModelObj.drawerType = self.storyboard
        //        imgViewProfilePic.sd_setImage(with: URL.init(string: profileModelObj.profileImage),placeholderImage:#imageLiteral(resourceName: "ic_default_user"),completed: nil)
        //        lblPassengerName.text = profileModelObj.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        imgViewProfilePic.sd_setImage(with: URL.init(string: profileModelObj.profileImage),placeholderImage:#imageLiteral(resourceName: "ic_default_user"),completed: nil)
        //        lblPassengerName.text = profileModelObj.name
    }
    
    override func viewDidAppear(_ animated: Bool) {
        protocolDrawerNav?.openDrawer?()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        protocolDrawerNav?.dismissDrawer?()
    }
    
    //MARK:- Actions
    
    @IBAction func actionViewProfile(_ sender: Any) {
        self.revealViewController().revealToggle(animated: true)
        //        Proxy.shared.pushToNextVC(storyborad: StoryboardChange.customerStoryboard, identifier: <#T##String#>, isAnimate: <#T##Bool#>, currentViewController: <#T##UIViewController#>)(identifier: "ProfileVC")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
