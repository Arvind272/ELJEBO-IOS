//
//  SelectMultipleImage.swift
//  Foosto
//
//  Created by Sukhpreet Kaur on 3/27/18.
//  Copyright © 2018 Sukhpreet Kaur. All rights reserved.
//
import UIKit
import Foundation
import DKImagePickerController

protocol multipleImageDelegate {
    func passSelectedimages(selectedImages: [DKAsset])
}
var multipleImageObj:multipleImageDelegate?

class SelectMultipleImage: NSObject,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //MARK:- variable Decleration
    var ImagePicker = UIImagePickerController()
    var clickImage = UIImage()
    var assets: [DKAsset]?
    
    //Mark:- Choose Image Method
    func customActionSheet() {
        
        let myActionSheet = UIAlertController()
        let galleryAction = UIAlertAction(title: "Gallery", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.openGallary()
        })
        let cmaeraAction = UIAlertAction(title:"Camera", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.openCamera()
        })
        
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        myActionSheet.addAction(galleryAction)
        myActionSheet.addAction(cmaeraAction)
        myActionSheet.addAction(cancelAction)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(myActionSheet, animated: true, completion: nil)
    }
    
    //MARK:- Open Image Camera
    func openCamera() {
        let assetType:DKImagePickerControllerAssetType = .allPhotos
        
        let allowMultipleType:Bool = false
        let sourceType: DKImagePickerControllerSourceType = .camera
        let allowsLandscape :Bool = false
        let singleSelect :Bool = false
        
        self.showImagePickerWithCameraAssetType(
            assetType,
            allowMultipleType: allowMultipleType,
            sourceType: sourceType,
            allowsLandscape: allowsLandscape,
            singleSelect: singleSelect
        )
    }
    
    //MARK:- Open Image Gallery
    func openGallary() {
        let assetType:DKImagePickerControllerAssetType = .allPhotos
        let allowMultipleType:Bool = true
        let sourceType: DKImagePickerControllerSourceType = .photo
        let allowsLandscape :Bool = false
        let singleSelect :Bool = false
        self.showImagePickerWithAssetType(
            assetType,
            allowMultipleType: allowMultipleType,
            sourceType: sourceType,
            allowsLandscape: allowsLandscape,
            singleSelect: singleSelect
        )
    }
    func updateGallary(_ completion:@escaping() -> Void) {
        let assetType:DKImagePickerControllerAssetType = .allPhotos
        let allowMultipleType:Bool = true
        let sourceType: DKImagePickerControllerSourceType = .photo
        let allowsLandscape :Bool = false
        let singleSelect :Bool = false
        self.showImagePickerWithAssetType(
            assetType,
            allowMultipleType: allowMultipleType,
            sourceType: sourceType,
            allowsLandscape: allowsLandscape,
            singleSelect: singleSelect
            
        )
        completion()
       
    }
   
    //MARK:- Selectedimage
    func setSelectedimage(_ imageAsset:  [DKAsset]) {
        
        multipleImageObj?.passSelectedimages(selectedImages: imageAsset)
    }
    
    func showImagePickerWithAssetType(_ assetType: DKImagePickerControllerAssetType,
                                      allowMultipleType: Bool,
                                      sourceType: DKImagePickerControllerSourceType = .photo,
                                      allowsLandscape: Bool,
                                      singleSelect: Bool) {
        
        let pickerController = DKImagePickerController()
        
        pickerController.assetType = assetType
        pickerController.allowsLandscape = allowsLandscape
        pickerController.allowMultipleTypes = allowMultipleType
        pickerController.sourceType = sourceType
        pickerController.singleSelect = singleSelect
        pickerController.maxSelectableCount = 3
        pickerController.defaultSelectedAssets = self.assets
        pickerController.showsCancelButton = true
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            
            print("didSelectAssets")
            self.assets = assets
            self.setSelectedimage( self.assets!)
        }

        if UI_USER_INTERFACE_IDIOM() == .pad {
            pickerController.modalPresentationStyle = .formSheet;
        }
        
       UIApplication.shared.keyWindow?.rootViewController?.present(pickerController, animated: true, completion: nil)
    }
    
    func showImagePickerWithCameraAssetType(_ assetType: DKImagePickerControllerAssetType,
                                            allowMultipleType: Bool,
                                            sourceType: DKImagePickerControllerSourceType = .camera,
                                            allowsLandscape: Bool,
                                            singleSelect: Bool){
        
        let pickerController = DKImagePickerController()
        pickerController.assetType = assetType
        pickerController.allowsLandscape = allowsLandscape
        pickerController.allowMultipleTypes = allowMultipleType
        pickerController.sourceType = sourceType
        pickerController.singleSelect = singleSelect
        pickerController.maxSelectableCount = 10
        pickerController.showsCancelButton = true
        pickerController.defaultSelectedAssets = self.assets
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            self.assets = assets
            self.setSelectedimage( self.assets!)
        }
        
        pickerController.didCancel = {
            self.setSelectedimage( self.assets!)
        }
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            pickerController.modalPresentationStyle = .formSheet;
        }
        UIApplication.shared.keyWindow?.rootViewController?.present(pickerController, animated: true, completion: nil)
    }
    
    
}

