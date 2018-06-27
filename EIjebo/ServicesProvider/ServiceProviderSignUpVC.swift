//
//  ServiceProviderSignUpVC.swift
//  EIjebo
//
//  Created by Sonu Sharma on 13/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
import DKImagePickerController
import Photos
import GooglePlaces

class ServiceAmountTVC: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtAmount: UITextField!
}
class CertificatesCVC:UICollectionViewCell{
    @IBOutlet weak var imgVwCertificate: UIImageView!
     @IBOutlet weak var btnCross: UIButton!
    
}
class ServiceProviderSignUpVC: UIViewController ,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate,UITextFieldDelegate,multipleImageDelegate,UICollectionViewDelegate, UICollectionViewDataSource, GMSAutocompleteViewControllerDelegate{
   
    
    @IBOutlet weak var constTableHeght: NSLayoutConstraint!
    @IBOutlet weak var consServicesTblHeight: NSLayoutConstraint!
    
    
    // MARK: - IBOUTLET
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var tblVwServiceAmount: UITableView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet var btnSignUp : UIButton!
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtConfirmEmail: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtAddress1: UITextField!
    @IBOutlet weak var txtAddress2: UITextField!
    @IBOutlet weak var txtZipCode: UITextField!
    @IBOutlet weak var txtPhnNumber: UITextField!
    @IBOutlet weak var txtQus1: UITextField!
    @IBOutlet weak var txtAns1: UITextField!
    @IBOutlet weak var txtQus2: UITextField!
    @IBOutlet weak var txtAns2: UITextField!
    @IBOutlet weak var txtQus3: UITextField!
    @IBOutlet weak var txtAns3: UITextField!
    @IBOutlet weak var txtCerticate: UITextField!
    @IBOutlet weak var txtSelectServices: UITextField!
    
    @IBOutlet weak var txtFldCountryResidence: UITextField!
    @IBOutlet weak var txtFldCity: UITextField!
    @IBOutlet weak var txtFldState: UITextField!
    @IBOutlet weak var txtFldToTime: UITextField!
    @IBOutlet weak var txtFldFromTime: UITextField!
    
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
    @IBOutlet weak var colVwCertificates: UICollectionView!
    @IBOutlet weak var colVwHeightConstrt: NSLayoutConstraint!
    
    // MARK: - VARIABLE
    var selectedSection = Int()
     var selectedIndex = -1
    let valueArr = [["sub_service_id":"","charge_amount":""]]
    var selectedServicesArray = NSMutableArray()
    var timePicker = UIDatePicker()
    var cameFromGalley = ""
    var selectMultipleImageObj =  SelectMultipleImage()
    var assets: [DKAsset]?
    var objAddress = AddressListVM()
    var objServicesVM = CommonServicesListViewModal()
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedSection = -1
        multipleImageObj = self
        objServicesSignupVM.gender = ""
        colVwHeightConstrt.constant = 0
        txtFldCountryResidence.rightImage(image:#imageLiteral(resourceName: "ic_dropdown"), imgW: 16, imgH: 10)
        txtFldCity.rightImage(image:#imageLiteral(resourceName: "ic_dropdown"), imgW: 16, imgH: 10)
        txtFldState.rightImage(image:#imageLiteral(resourceName: "ic_dropdown"), imgW: 16, imgH: 10)
        txtFldToTime.rightImage(image:#imageLiteral(resourceName: "ic_dropdown"), imgW: 16, imgH: 10)
        txtFldFromTime.rightImage(image:#imageLiteral(resourceName: "ic_dropdown"), imgW: 16, imgH: 10)
        timePicker.datePickerMode = .time
        txtFldToTime.inputView = timePicker
        timePicker.minimumDate = Date()
        txtFldFromTime.inputView = timePicker
        consServicesTblHeight.constant = 0
        self.tblView.register(UINib.init(nibName: "CheckListTVC", bundle: nil), forCellReuseIdentifier:"CheckListTVC")
        self.tblView.register(UINib.init(nibName: "HeaderTVC", bundle: nil), forCellReuseIdentifier:"HeaderTVC")
      
        NotificationCenter.default.addObserver(self, selector: #selector(handelNotification(_:)), name: NSNotification.Name("selectAddress"), object: nil)
        objServicesVM.servicesListApi{
            self.tblView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tblView.delegate = self
        tblView.dataSource = self
        tblView.reloadData()
        tblVwServiceAmount.delegate = self
        tblVwServiceAmount.dataSource = self
          colVwCertificates.reloadData()
        tblVwServiceAmount.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - IBACTIONS
   
    @objc func handelNotification(_ notification: Notification)
    {
        let adressDict = notification.object as! AddressModel
        if objDefaultVal.isAdressList == "country"{
            txtFldCountryResidence.text =  adressDict.title
            objAddress.id = adressDict.id
        }
        if objDefaultVal.isAdressList == "state"{
            txtFldState.text =  adressDict.title
            objAddress.id = adressDict.id
            
        }
        if objDefaultVal.isAdressList == "city"{
            txtFldCity.text =  adressDict.title
            objAddress.id = adressDict.id
        }
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
        else if objServicesSignupVM.gender.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.selectgender)
        }else if txtFldCountryResidence.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.country)
        }else if txtAddress1.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.address)
        }else if txtFldState.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.state)
        }else if txtFldCity.text!.isEmpty {
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
        else if objServicesSignupVM.education.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.selectEducation)
        }
        else if txtCerticate.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.certificate)
        }
        else if txtFldFromTime.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.time)
        }
        else if txtFldToTime.text!.isEmpty {
            Proxy.shared.displayStatusCodeAlert(AlertValue.time)
        }
        else{
            objServicesSignupVM.firstName = txtFirstName.text!
            objServicesSignupVM.lastName = txtLastName.text!
            objServicesSignupVM.email = txtEmail.text!
            objServicesSignupVM.userName = txtUserName.text!
            objServicesSignupVM.password = txtPassword.text!
            objServicesSignupVM.country = txtFldCountryResidence.text!
            objServicesSignupVM.address = txtAddress1.text!
            objServicesSignupVM.address2 = txtAddress2.text!
            objServicesSignupVM.state = txtFldState.text!
            objServicesSignupVM.city = txtFldCity.text!
            objServicesSignupVM.zipCode = txtZipCode.text!
            objServicesSignupVM.phnNo = txtPhnNumber.text!
            objServicesSignupVM.qus1 = txtQus1.text!
            objServicesSignupVM.qus2 = txtQus2.text!
            objServicesSignupVM.qus3 = txtQus3.text!
            objServicesSignupVM.ans1 = txtAns1.text!
            objServicesSignupVM.ans2 = txtAns2.text!
            objServicesSignupVM.ans3 = txtAns3.text!
            objServicesSignupVM.certificate = txtCerticate.text!
            objServicesSignupVM.fromTime = txtFldFromTime.text!
            objServicesSignupVM.toTime = txtFldToTime.text!
             objServicesSignupVM.questionArr = [["question":txtQus1.text!, "answer":txtAns1.text!],["question":txtQus2.text!, "answer":txtAns2.text!],["question":txtQus3.text!, "answer":txtAns3.text!]]
            print(selectedServicesArray)
            for i in 0..<selectedServicesArray.count{
            let listDict = selectedServicesArray[i] as! NSMutableDictionary
            listDict.setValue( listDict["charge_amount"] as? String, forKey: "charge_amount")
            listDict.setValue( listDict["sub_service_id"] as? String, forKey: "sub_service_id")
             objServicesSignupVM.selectedServicesArr.add(listDict)
            }
           print(objServicesSignupVM.selectedServicesArr)
            Proxy.shared.pushToNextVC(storyborad: StoryboardType.serviceProviderStoryboard, identifier:"PaymentsVC" , isAnimate: true, currentViewController: self)
           
        }
    }
    @IBAction func actionBack(_ sender: Any) {
        Proxy.shared.popToBackVC(isAnimate: true, currentViewController: self)
    }
    
   
    @IBAction func actionGender(_ sender: UIButton) {
        imgVwMale.image = #imageLiteral(resourceName: "ic_unfilled_cirle")
        imgVwFemale.image = #imageLiteral(resourceName: "ic_unfilled_cirle")
        imgVwOther.image = #imageLiteral(resourceName: "ic_unfilled_cirle")
        switch sender.tag {
        case 0:
            imgVwMale.image = #imageLiteral(resourceName: "ic_radio_on")
            objServicesSignupVM.gender = "\(Gender.male.rawValue)"
            
        case 1:
            imgVwFemale.image = #imageLiteral(resourceName: "ic_radio_on")
            objServicesSignupVM.gender = "\(Gender.female.rawValue)"
        case 2:
            imgVwOther.image = #imageLiteral(resourceName: "ic_radio_on")
            objServicesSignupVM.gender = "\(Gender.others.rawValue)"
        default:
            objServicesSignupVM.gender = ""
            break
        }
    }
    @IBAction func actionEducation(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if imgVwGED.image == #imageLiteral(resourceName: "ic_check"){
                imgVwGED.image = #imageLiteral(resourceName: "ic_uncheck")
                objServicesSignupVM.education = ""
            }else{
                imgVwGED.image = #imageLiteral(resourceName: "ic_check")
                objServicesSignupVM.education = "\(Education.ged.rawValue)"
            }
            
        case 1:
            if imgVwHightSchool.image == #imageLiteral(resourceName: "ic_check"){
                imgVwHightSchool.image = #imageLiteral(resourceName: "ic_uncheck")
                objServicesSignupVM.education = ""
            }else{
                imgVwHightSchool.image = #imageLiteral(resourceName: "ic_check")
                objServicesSignupVM.education = "\(Education.high.rawValue)"
            }
        case 2:
            if  imgVwCollege.image == #imageLiteral(resourceName: "ic_check"){
                imgVwCollege.image = #imageLiteral(resourceName: "ic_uncheck")
                objServicesSignupVM.education = ""
            }else{
                imgVwCollege.image = #imageLiteral(resourceName: "ic_check")
                objServicesSignupVM.education = "\(Education.collage.rawValue)"
            }
        default:
            objServicesSignupVM.education = ""
            break
        }
    }
    
    
    @IBAction func actionSelectCertificate(_ sender: UIButton) {
        selectMultipleImageObj.customActionSheet()
        
    }
    @IBAction func actionAddress(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
        
    }
    func passSelectedimages(selectedImages: [DKAsset]) {
        cameFromGalley = "Gallery"
        objServicesSignupVM.imagesArray=[]
        assets = []
        assets = selectedImages
        if selectedImages.count != 0 {
            //Proxy.shared.showActivityIndicator()
            colVwHeightConstrt.constant = 100
            for i in 0 ..< selectedImages.count {
                selectedImages[i].fetchImageWithSize(PHImageManagerMaximumSize, options: PHImageRequestOptions()) { image, info in
                    var img = UIImage()
                    img = image!
                     objServicesSignupVM.imagesArray.append(img)
                    if  objServicesSignupVM.imagesArray.count == selectedImages.count {
                        self.colVwCertificates.reloadData()
                    }
                }
            }
        }
        else{
            colVwHeightConstrt.constant = 0
           self.colVwCertificates.reloadData()
        }
        
    }
    @objc func deleteImage(_ sender:UIButton)
    {
        selectMultipleImageObj.openGallary()
    }
    //MARK : - AUTOCOMPLETE
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        txtAddress1.text = place.formattedAddress!
        objServicesSignupVM.latitute = "\(place.coordinate.latitude)"
        objServicesSignupVM.longitute = "\(place.coordinate.longitude)"
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
      
        print("Error: ", error.localizedDescription)
    }
    
 
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}

