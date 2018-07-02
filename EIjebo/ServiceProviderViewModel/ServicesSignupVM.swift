//
//  ServicesSignupVM.swift
//  EIjebo
//
//  Created by Ankita Thakur on 16/06/18.
//  Copyright © 2018 Sonu Sharma. All rights reserved.
//

import UIKit
  var objServicesSignupVM = ServicesSignupVM()
class ServicesSignupVM: NSObject {
    var firstName,lastName,email,conEmail,userName,password,conPass,gender,country,address,address2,state,city,zipCode,phnNo,qus1,ans1,qus2,ans2,qus3,ans3,education,certificate,cardType,cardHolderName,cardNo,expMonth,expYear,cardCvv,latitute,longitute,fromTime,toTime:String!
     var imagesArray = [UIImage]()
     var questionArr = NSArray()
     var selectedServicesArr = NSMutableArray()
 
    func signupApi(_ completion:@escaping() -> Void)   {

        var deviceTokken =  String()
        if UserDefaults.standard.object(forKey: "device_token") == nil {
            deviceTokken = "000000000000000000000000000000000000000000000000000000000000055"
        } else {
            deviceTokken = UserDefaults.standard.object(forKey: "device_token")! as! String
        }
        var qusetionsStr = String()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: questionArr, options: JSONSerialization.WritingOptions.prettyPrinted)
            qusetionsStr = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
            
        }catch let error as NSError{
            print(error.description)
        }
        var subCategory = String()
        do {
            let jsonData1 = try JSONSerialization.data(withJSONObject: selectedServicesArr, options: JSONSerialization.WritingOptions.prettyPrinted)
            subCategory = NSString(data: jsonData1, encoding: String.Encoding.utf8.rawValue)! as String
            
        }catch let error as NSError{
            print(error.description)
        }
        let param = [
            "firstname" :firstName!,
            "lastname" :lastName!,
            "email":email!,
            "password":password,
            "username":userName!,
            "zip_code":zipCode!,
            "gender":gender!,
            "country_id":country!,
            "address":address!,
            "address2":address2!,
            "state_id":state!,
            "city_id":city!,
            "education":education!,
            "User[availability_time_from]":fromTime,
            "User[availability_time_to]":toTime,
            "mobile":phnNo,
            "UserCardDetail[card_holder_name]":cardHolderName,
            "UserCardDetail[card_number]":cardNo,
            "UserCardDetail[expiry_month]":expMonth,
            "UserCardDetail[expiry_year]":expYear,
            "UserCardDetail[cvv]":cardCvv,
            "latitude" : latitute!,
            "longitude":longitute!,
            "security_que_ans":qusetionsStr,
            "sub_category":subCategory,
            "device_type":"1",
            "device_token":deviceTokken,
            
            ] as [String:AnyObject]
        
        var paramImage = [String:UIImage]()
        for i in 0..<self.imagesArray.count {
            paramImage["Menu[multiImage][\(i)]"] =  imagesArray[i]
        }
        let addItemUrl = "http://103.15.67.74/eljebo/webservice/new/main/serviceProviderSignup"
        WebServiceProxy.shared.uploadImage(param, parametersImage: paramImage, addImageUrl: addItemUrl, showIndicator: true) { (jsonResponse) in
            //Proxy.shared.displayStatusCodeAlert(SuccessAlertValue.itemAdded)
            if jsonResponse["status"] as! Int == 1 {
                Proxy.shared.displayStatusCodeAlert("Registered Successfully")
                if let auth = jsonResponse["id"] as? String {
                    UserDefaults.standard.set(auth, forKey: "user_id")
                    UserDefaults.standard.synchronize()
                }
                completion()
            } else {
                if let error = jsonResponse["message"] as? String {
                    Proxy.shared.displayStatusCodeAlert(error)
                }
            }
            
        }
        
    }
 
}
extension ServiceProviderSignUpVC {
    // MARK:- CollactionVIEW
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colVwCertificates.dequeueReusableCell(withReuseIdentifier: "CertificatesCVC", for: indexPath) as! CertificatesCVC
        cell.imgVwCertificate.image = objServicesSignupVM.imagesArray[indexPath.row]
        cell.btnCross.tag = indexPath.row
        cell.btnCross.addTarget(self, action: #selector(deleteImage(_:)), for: .touchUpInside)       cell.imgVwCertificate.image = objServicesSignupVM.imagesArray[indexPath.row]
        cell.btnCross.tag = indexPath.row
        cell.btnCross.addTarget(self, action: #selector(deleteImage(_:)), for: .touchUpInside)       cell.imgVwCertificate.image = objServicesSignupVM.imagesArray[indexPath.row]
        cell.btnCross.tag = indexPath.row
        cell.btnCross.addTarget(self, action: #selector(deleteImage(_:)), for: .touchUpInside)
        return cell
    }
    // MARK:- TABLEVIEW
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tblView{
            return objServicesVM.servicesListArr.count
        }else{
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tblView {
            if selectedSection == section {
                return objServicesVM.servicesListArr[selectedSection].subServicesArr.count
            }
            else{
                return 0
            }
        }else{
            return selectedServicesArray.count
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == tblView{
            return 40
        }else{
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tblView{
            return 40
        }else{
            return UITableViewAutomaticDimension
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()
        if tableView == tblView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListTVC") as! CheckListTVC
            
            let sec = objServicesVM.servicesListArr[indexPath.section]
            let subCatDict = sec.subServicesArr[indexPath.row]
            cell.lblTitle.text = subCatDict.title!
            cell.btnSelect.tag = indexPath.row
            cell.btnSelect.isUserInteractionEnabled = false
            if objServicesVM.servicesListArr.count != 0 {
                let secServices = objServicesVM.servicesListArr[selectedSection]
                let subCatDict  = secServices.subServicesArr[indexPath.row]
                let predicate = NSPredicate(format: "sub_service_id == %@", subCatDict.id!)
                let searchDataSource = selectedServicesArray.filter { predicate.evaluate(with: $0) }
                if searchDataSource.count > 0  {
                    cell.btnSelect.isSelected = true
                }
                else{
                    cell.btnSelect.isSelected = false
                }
            }
            
            returnCell = cell
        }else{
            let cell = tblVwServiceAmount.dequeueReusableCell(withIdentifier: "ServiceAmountTVC") as! ServiceAmountTVC
            let dict = selectedServicesArray[indexPath.row] as! NSMutableDictionary
            cell.txtAmount.delegate = self
            cell.txtAmount.tag = indexPath.row+1
            cell.lblTitle.text = dict["title"] as? String
            cell.txtAmount.text = dict["charge_amount"] as? String
            returnCell = cell
        }
        return returnCell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        let sec = objServicesVM.servicesListArr[selectedSection]
        let subCatDict = sec.subServicesArr[indexPath.row]
        let value = subCatDict.title!
        let servicesId = subCatDict.id!
        let predicate = NSPredicate(format: "sub_service_id contains %@", servicesId)
        let searchDataSource = selectedServicesArray.filter { predicate.evaluate(with: $0) }
        if searchDataSource.count > 0 {
            selectedServicesArray.removeObject(at: indexPath.row)
        }
        else{
           
            let listDict =  NSMutableDictionary()
            listDict.setValue(value, forKey: "title")
            listDict.setValue(servicesId, forKey: "sub_service_id")
            listDict.setValue("", forKey: "charge_amount")
            selectedServicesArray.add(listDict)
        }
        tblVwServiceAmount.reloadData()
        tblView.reloadData()
        consServicesTblHeight.constant = tblVwServiceAmount.contentSize.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == tblView{
            let headerView = tblView.dequeueReusableCell(withIdentifier: "HeaderTVC") as! HeaderTVC
            headerView.tag = section
            
            headerView.tag = section
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedView(_:)))
            tapGesture.delegate = self
            tapGesture.numberOfTapsRequired = 1
            tapGesture.numberOfTouchesRequired = 1
            headerView.addGestureRecognizer(tapGesture)
            let servicesDict = objServicesVM.servicesListArr[section]
            headerView.lblTitle.text = servicesDict.title!
            if selectedSection == section {
                headerView.btnSelected.setImage(#imageLiteral(resourceName: "ic_dropdown"),for: . normal)
                
            }else{
                headerView.btnSelected.setImage(#imageLiteral(resourceName: "ic_uparw") ,for: . normal)
            }
            return headerView
        }
        return UIView()
    }
    
    @objc func tappedView ( _ sender : UITapGestureRecognizer ){
        
        if selectedSection == sender.view!.tag{
            selectedSection = -1
            
        } else {
            selectedSection = sender.view!.tag
            
        }
        tblView.reloadData()
    }
    
    //MARK :- TEXTFEILD DELEGATES
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.tag > 0{
        let indexPath = IndexPath(row: textField.tag-1, section: 0)
        let cell = tblVwServiceAmount.cellForRow(at: indexPath) as! ServiceAmountTVC
        let listDict = selectedServicesArray[textField.tag-1] as! NSMutableDictionary
        listDict.setValue(cell.txtAmount.text!, forKey: "charge_amount")
        selectedServicesArray.replaceObject(at: textField.tag-1, with: listDict)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtFirstName
        {
            txtFirstName.resignFirstResponder()
            txtLastName.becomeFirstResponder()
        }
        if textField == txtLastName
        {
            txtLastName.resignFirstResponder()
            txtEmail.becomeFirstResponder()
        }
        else if textField == txtEmail
        {
            txtEmail.resignFirstResponder()
            txtConfirmEmail.becomeFirstResponder()
        }
        else if textField == txtConfirmEmail
        {
            txtConfirmEmail.resignFirstResponder()
            txtUserName.becomeFirstResponder()
        }
        else if textField == txtUserName
        {
            txtUserName.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        }
        else if textField == txtPassword
        {
            txtPassword.resignFirstResponder()
            txtConfirmPassword.becomeFirstResponder()
        }
        else if textField == txtConfirmPassword
        {
            txtConfirmPassword.resignFirstResponder()
            txtFldCountryResidence.becomeFirstResponder()
        }
            
        else if textField == txtFldCountryResidence
        {
            txtFldCountryResidence.resignFirstResponder()
            txtAddress1.becomeFirstResponder()
        }
        else if textField == txtAddress1
        {
            txtAddress1.resignFirstResponder()
            txtAddress2.becomeFirstResponder()
        }else  if textField == txtAddress2
        {
            txtAddress2.resignFirstResponder()
            txtFldCity.becomeFirstResponder()
        }
        if textField == txtFldCity
        {
            txtFldCity.resignFirstResponder()
            txtFldState.becomeFirstResponder()
        }
        else if textField == txtFldState
        {
            txtFldState.resignFirstResponder()
            txtZipCode.becomeFirstResponder()
        }
        else if textField == txtZipCode
        {
            txtZipCode.resignFirstResponder()
            txtPhnNumber.becomeFirstResponder()
        }
        else if textField == txtPhnNumber
        {
            txtPhnNumber.resignFirstResponder()
            txtQus1.becomeFirstResponder()
        }
        else if textField == txtQus1
        {
            txtQus1.resignFirstResponder()
            txtAns1.becomeFirstResponder()
        } else if textField == txtAns1
        {
            txtAns1.resignFirstResponder()
            txtQus2.becomeFirstResponder()
        }
        else if textField == txtQus2
        {
            txtQus2.resignFirstResponder()
            txtAns2.becomeFirstResponder()
        }
        else if textField == txtAns2
        {
            txtAns2.resignFirstResponder()
            txtQus3.becomeFirstResponder()
        }
        else if textField == txtQus3
        {
            txtQus3.resignFirstResponder()
            txtAns3.becomeFirstResponder()
        }
        else if textField == txtAns3
        {
            txtAns3.resignFirstResponder()
            txtCerticate.becomeFirstResponder()
        }
            
        else if textField == txtCerticate
        {
            txtCerticate.resignFirstResponder()
            txtSelectServices.becomeFirstResponder()
        }
        else if textField == txtSelectServices
        {
            txtSelectServices.resignFirstResponder()
            txtFldToTime.becomeFirstResponder()
        }
        else if textField == txtFldToTime
        {
            txtFldToTime.resignFirstResponder()
            txtFldFromTime.becomeFirstResponder()
        }
        else
        {
            txtFldFromTime.resignFirstResponder()
        }
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case txtFldCountryResidence:
            self.view.endEditing(true)
        case txtFldState:
            self.view.endEditing(true)
        case txtFldCity:
            self.view.endEditing(true)
        case txtAddress1:
            self.view.endEditing(true)
        default:
            break
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFldToTime:
            timePicker.minimumDate = Date()
            txtFldToTime.text = Proxy.shared.getStringFrmDate(getDate: timePicker.date, format: "HH:mm")
            timePicker.tag = 1
            timePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
            txtFldFromTime.text = ""
        case txtFldFromTime :
            if txtFldToTime.text != ""{
                timePicker.minimumDate = Proxy.shared.getDateFrmString(getDate: txtFldToTime.text!, format: "HH:mm")
                txtFldFromTime.text = Proxy.shared.getStringFrmDate(getDate: timePicker.date, format: "HH:mm")
                timePicker.tag = 2
                timePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
            }else{
                Proxy.shared.displayStatusCodeAlert("Please Enter To Time first")
            }
        case txtFldCountryResidence:
            let presentControllerObj = StoryboardType.customerStoryboard.instantiateViewController(withIdentifier: "AddressListVC")as! AddressListVC
            objDefaultVal.isAdressList = "country"
            self.navigationController?.present(presentControllerObj, animated: true, completion: nil)
        case txtFldState:
            let presentControllerObj = StoryboardType.customerStoryboard.instantiateViewController(withIdentifier: "AddressListVC")as! AddressListVC
            objDefaultVal.isAdressList = "state"
            presentControllerObj.objAddressModel.id = objAddress.id
            self.navigationController?.present(presentControllerObj, animated: true, completion: nil)
        case txtFldCity:
            let presentControllerObj = StoryboardType.customerStoryboard.instantiateViewController(withIdentifier: "AddressListVC")as! AddressListVC
            objDefaultVal.isAdressList = "city"
            presentControllerObj.objAddressModel.id = objAddress.id
            self.navigationController?.present(presentControllerObj, animated: true, completion: nil)
        default:
            break
        }
        return true
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        switch sender.tag {
        case 1:
            txtFldToTime.text = Proxy.shared.getStringFrmDate(getDate: sender.date, format: "HH:mm")
        case 2:
            timePicker.minimumDate = Proxy.shared.getDateFrmString(getDate: txtFldToTime.text!, format: "HH:mm")
            txtFldFromTime.text = Proxy.shared.getStringFrmDate(getDate: sender.date, format: "HH:mm")
        default:
            break
        }
    }

   
}
