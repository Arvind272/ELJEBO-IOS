//
//  FeedBackVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
class FeedBackVC: UIViewController {

    @IBOutlet weak var vwRatingView: FloatRatingView!
    @IBOutlet weak var txtVwComments: IQTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionBackBtn(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    
    @IBAction func actionSubmit(_ sender: Any) {
        let story = self.storyboard
        if story == StoryboardType.customerStoryboard{
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: HomeVC.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        }
        else{
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: ServicesHomeVC.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        }
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
