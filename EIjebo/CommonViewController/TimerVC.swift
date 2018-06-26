//
//  TimerVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 12/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class TimerVC: UIViewController {
    // MARK: - IBOUTLET
    @IBOutlet var lblTimer : UILabel!
    // MARK: - VARIABLE
  
    // MARK: - LIFECYCLE
 
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTimer.attributedText = Proxy.shared.withTextSizeAttributedString(fullString: "20mins", fullStringColor: .black, subString: "20", subStringColor: AppInfo.redColor)
       
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - IBACTIONS
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    @IBAction func actionPay(_ sender: Any) {
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "FeedBackVC", isAnimate: true, currentViewController: self)
    }
}
