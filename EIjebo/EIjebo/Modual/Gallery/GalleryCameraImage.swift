//
//  GalleryCameraImage.swift
//  Triarch LLC
//  Created by Ankita Thakur on 13/02/18.
//  Copyright © 2018 Ankita Thakur. All rights reserved.

import UIKit
import Foundation
protocol passImageDelegate {
    func passSelectedimage(selectImage: UIImage)
}
var galleryCameraImageObj:passImageDelegate?

class GalleryCameraImage: NSObject,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //MARK:- variable Decleration
    var ImagePicker = UIImagePickerController()
    var imageTapped = Int()
    var clickImage = UIImage()
    
    
    //Mark:- Choose Image Method
    func customActionSheet() {
        
        let myActionSheet = UIAlertController()
        let galleryAction = UIAlertAction(title: "Gallery", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.openGallary()
        })
        let cmaeraAction = UIAlertAction(title: "Camera", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.openCamera()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        myActionSheet.addAction(galleryAction)
        myActionSheet.addAction(cmaeraAction)
        myActionSheet.addAction(cancelAction)
        
     //   KAppDelegate.window?.currentViewController()?.present(myActionSheet, animated: true, completion: nil)
    }
    
    //MARK:- Open Image Camera
    func openCamera() {
        DispatchQueue.main.async {
            if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
                self.ImagePicker.sourceType = UIImagePickerControllerSourceType.camera
                self.ImagePicker.delegate = self
                self.ImagePicker.allowsEditing = true
            //    KAppDelegate.window?.currentViewController()?.present(self.ImagePicker, animated: true, completion: nil)
                
            } else {
                let alert = UIAlertController(title: "Alert", message: "Camera is not supported", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(okAction)
               // KAppDelegate.window?.currentViewController()?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK:- Open Image Gallery
    func openGallary() {
        ImagePicker.delegate = self
        ImagePicker.allowsEditing = true
        ImagePicker.sourceType = .photoLibrary
      //  KAppDelegate.window?.currentViewController()?.present(ImagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        DispatchQueue.main.async {
            if(picker.sourceType == UIImagePickerControllerSourceType.camera) {
                let objImagePick: UIImage = (info[UIImagePickerControllerEditedImage] as! UIImage)
               self.setSelectedimage(objImagePick)
            } else {
                let objImagePick: UIImage = (info[UIImagePickerControllerEditedImage] as! UIImage)
                self.setSelectedimage(objImagePick)
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Selectedimage
    func setSelectedimage(_ image: UIImage) {
        clickImage = image
        galleryCameraImageObj?.passSelectedimage(selectImage: clickImage)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       // KAppDelegate.window?.currentViewController()?.dismiss(animated: true, completion: nil)
    }
    
   
}
