//
//  PaymentsVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class PaymentsVC: UIViewController {
    // MARK: - IBOUTLET
    // MARK: - VARIABLE
    var dataDict = NSDictionary()
    // MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
  // MARK: - IBACTIONS
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    @IBAction func actionsPayments(_ sender: UIButton) {
        let storyboard = self.storyboard
      
        if storyboard == StoryboardType.customerStoryboard{
            objSignupVM.cardType = "\(sender.tag)"
        Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier: "AddCardsDetailsVC", isAnimate: true, currentViewController: self)
        }
        else{
            objServicesSignupVM.cardType = "\(sender.tag)"
             Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier: "AddCardsDetailsVC", isAnimate: true, currentViewController: self)
        }
        
    }
}
