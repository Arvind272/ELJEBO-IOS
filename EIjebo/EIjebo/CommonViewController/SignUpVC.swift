//
//  LoginVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 11/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
import GooglePlaces
class SignUpVC: UIViewController, UITextFieldDelegate,GMSAutocompleteViewControllerDelegate {
    // MARK: - IBOUTLET
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtConfirmEmail: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtAddress1: UITextField!
    @IBOutlet weak var txtAddress2: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZipCode: UITextField!
    @IBOutlet weak var txtPhnNumber: UITextField!
    @IBOutlet weak var txtQus1: UITextField!
    @IBOutlet weak var txtAns1: UITextField!
    @IBOutlet weak var txtQus2: UITextField!
    @IBOutlet weak var txtAns2: UITextField!
    @IBOutlet weak var txtQus3: UITextField!
    @IBOutlet weak var txtAns3: UITextField!
    @IBOutlet weak var txtCerticate: UITextField!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    @IBOutlet weak var imgVwMale: UIImageView!
    @IBOutlet weak var imgVwFemale: UIImageView!
    @IBOutlet weak var imgVwOther: UIImageView!
    @IBOutlet weak var btnGED: UIButton!
    @IBOutlet weak var btnHightSchool: UIButton!
    @IBOutlet weak var btnCollege: UIButton!
    @IBOutlet weak var imgVwGED: UIImageView!
    @IBOutlet weak var imgVwHightSchool: UIImageView!
    @IBOutlet weak var imgVwCollege: UIImageView!
    @IBOutlet var btnSignUp : UIButton!
    // MARK: - VARIABLE
    var objAddress = AddressListVM()
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCountry.rightImage(image:#imageLiteral(resourceName: "ic_dropdown"), imgW: 16, imgH: 10)
        txtCity.rightImage(image:#imageLiteral(resourceName: "ic_dropdown"), imgW: 16, imgH: 10)
        txtState.rightImage(image:#imageLiteral(resourceName: "ic_dropdown"), imgW: 16, imgH: 10)
        NotificationCenter.default.addObserver(self, selector: #selector(handelNotification(_:)), name: NSNotification.Name("selectAddress"), object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    // MARK: - IBACTIONS
    @objc func handelNotification(_ notification: Notification)
    {
        let adressDict = notification.object as! AddressModel
        if objDefaultVal.isAdressList == "country"{
            txtCountry.text =  adressDict.title
            objAddress.id = adressDict.id
        }
        if objDefaultVal.isAdressList == "state"{
            txtState.text =  adressDict.title
            objAddress.id = adressDict.id
            
        }
        if objDefaultVal.isAdressList == "city"{
            txtCity.text =  adressDict.title
            objAddress.id = adressDict.id
        }
    }
    @IBAction func actionAddress(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    @IBAction func actionNext(_ sender: Any) {
        
        if txtFirstName.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.firstname)
        }
            
        else if txtLastName.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.lastname)
        }
        else if txtEmail.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.email)
        }
        else if txtConfirmEmail.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.emailconf)
        }
        else if txtConfirmEmail.text! != txtEmail.text!{
            Proxy.shared.displayStatusCodeAlert(AlertValue.conemail)
        }
        else if txtUserName.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.username)
        }else if txtPassword.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.password)
        }else if txtConfirmPassword.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.passwordConf)
        }
        else if txtConfirmPassword.text! != txtPassword.text!{
            Proxy.shared.displayStatusCodeAlert(AlertValue.confirmPass)
        }
        else if objSignupVM.gender.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.selectgender)
        }else if txtCountry.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.country)
        }else if txtAddress1.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.address)
        }else if txtState.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.state)
        }else if txtCity.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.city)
        }else if txtZipCode.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.zipcode)
        }else if txtPhnNumber.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.phoneNumber)
        }
        else if txtQus1.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.securityQus1)
        }
        else if txtQus2.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.securityQus2)
        }
        else if txtQus3.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.securityQus3)
        }
        else if txtAns1.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.securityans1)
        }
        else if txtAns2.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.securityans2)
        }
            
        else if txtAns3.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.securityans3)
        }
        else if objSignupVM.education.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.selectEducation)
        }
        else if txtCerticate.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.certificate)
        }
            
        else{
            objSignupVM.firstName = txtFirstName.text!
            objSignupVM.lastName = txtLastName.text!
            objSignupVM.email = txtEmail.text!
            objSignupVM.userName = txtUserName.text!
            objSignupVM.password = txtPassword.text!
            objSignupVM.country = txtCountry.text!
            objSignupVM.address = txtAddress1.text!
            objSignupVM.address2 = txtAddress2.text!
            objSignupVM.state = txtState.text!
            objSignupVM.city = txtCity.text!
            objSignupVM.zipCode = txtZipCode.text!
            objSignupVM.phnNo = txtPhnNumber.text!
            objSignupVM.qus1 = txtQus1.text!
            objSignupVM.qus2 = txtQus2.text!
            objSignupVM.qus3 = txtQus3.text!
            objSignupVM.ans1 = txtAns1.text!
            objSignupVM.ans2 = txtAns2.text!
            objSignupVM.ans3 = txtAns3.text!
             objSignupVM.questionArr = [["question":txtQus1.text!, "answer":txtAns1.text!],["question":txtQus2.text!, "answer":txtAns2.text!],["question":txtQus3.text!, "answer":txtAns3.text!]]
            objSignupVM.certificate = txtCerticate.text!
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.customerStoryboard, identifier:"PaymentsVC" , isAnimate: true, currentViewController: self)
        }
    }
    
    
    @IBAction func actionGender(_ sender: UIButton) {
        imgVwMale.image = #imageLiteral(resourceName: "ic_unfilled_cirle")
        imgVwFemale.image = #imageLiteral(resourceName: "ic_unfilled_cirle")
        imgVwOther.image = #imageLiteral(resourceName: "ic_unfilled_cirle")
        switch sender.tag {
        case 0:
            imgVwMale.image = #imageLiteral(resourceName: "ic_radio_on")
            objSignupVM.gender = "\(Gender.male.rawValue)"
            
        case 1:
            imgVwFemale.image = #imageLiteral(resourceName: "ic_radio_on")
            objSignupVM.gender = "\(Gender.female.rawValue)"
        case 2:
            imgVwOther.image = #imageLiteral(resourceName: "ic_radio_on")
            objSignupVM.gender = "\(Gender.others.rawValue)"
        default:
            objSignupVM.gender = ""
            break
        }
    }
    @IBAction func actionEducation(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if imgVwGED.image == #imageLiteral(resourceName: "ic_check"){
                imgVwGED.image = #imageLiteral(resourceName: "ic_uncheck")
                objSignupVM.education = ""
            }else{
                imgVwGED.image = #imageLiteral(resourceName: "ic_check")
                objSignupVM.education = "\(Education.ged.rawValue)"
            }
            
        case 1:
            if imgVwHightSchool.image == #imageLiteral(resourceName: "ic_check"){
                imgVwHightSchool.image = #imageLiteral(resourceName: "ic_uncheck")
                objSignupVM.education = ""
            }else{
                imgVwHightSchool.image = #imageLiteral(resourceName: "ic_check")
                objSignupVM.education = "\(Education.high.rawValue)"
            }
        case 2:
            if  imgVwCollege.image == #imageLiteral(resourceName: "ic_check"){
                imgVwCollege.image = #imageLiteral(resourceName: "ic_uncheck")
                objSignupVM.education = ""
            }else{
                imgVwCollege.image = #imageLiteral(resourceName: "ic_check")
                objSignupVM.education = "\(Education.collage.rawValue)"
            }
        default:
            objSignupVM.education = ""
            break
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    //MARK : - AUTOCOMPLETE
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        txtAddress1.text = place.formattedAddress!
        objSignupVM.latitute = "\(place.coordinate.latitude)"
         objSignupVM.longitute = "\(place.coordinate.longitude)"
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}
