//
//  AddCardsDetailsVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit

class AddCardsDetailsVC: UIViewController , UITextFieldDelegate {
    // MARK: - IBOUTLET
    
    @IBOutlet weak var txtFldCardName: UITextField!
    @IBOutlet weak var txtFldCardNumber: UITextField!
    @IBOutlet weak var txtFldMonthYear: UITextField!
    @IBOutlet weak var txtFldCVV: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Actions
    
    @IBAction func actionBack(_ sender: Any) {
        
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
        
    }
    @IBAction func actionsSave(_ sender: Any) {
        let storyboard = self.storyboard
        
        if txtFldCardName.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.cardHolder)
        }
            
        else if txtFldCardNumber.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.cardNumber)
        }
        else if txtFldCVV.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.cvvNumber)
        }
        else if txtFldMonthYear.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.expDate)
        }
        else{
            
            
           
            else {
                objServicesSignupVM.cardHolderName = txtFldCardName.text!
                objServicesSignupVM.cardNo = txtFldCardNumber.text!
                objServicesSignupVM.cardCvv = txtFldCVV.text!
                let fullExp =  txtFldMonthYear.text!
                let fullExpArr = fullExp.components(separatedBy: "/")
                objServicesSignupVM.expMonth = fullExpArr[0]
                objServicesSignupVM.expYear = fullExpArr[1]
                objServicesSignupVM.signupApi {
                Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier:"TermsAndConditionsVC", isAnimate: true, currentViewController: self)
            }
        }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
