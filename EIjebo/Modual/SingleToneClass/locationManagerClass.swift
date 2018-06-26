//
//  AppDelegate.swift
//  LTCExam
//
//  Created by Chitresh Goyal on 01/03/18.
//  Copyright © 2018 Chitresh Goyal. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation
import Alamofire
var locationUpdates = Bool()
var locationShareInstance:locationManagerClass = locationManagerClass()
class locationManagerClass: NSObject, CLLocationManagerDelegate , UIAlertViewDelegate
{
// MARK: - Class Variables

    var locationManager = CLLocationManager()
    
    class func sharedLocationManager() -> locationManagerClass
    {
        locationShareInstance = locationManagerClass()
        return locationShareInstance
    }
    
    var timer = Timer()
    func startStandardUpdates() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .automotiveNavigation
        locationManager.distanceFilter = 10
        // meters
        locationManager.pausesLocationUpdatesAutomatically = false
        
        
        if (Bundle.main.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") != nil) {
            locationManager.requestWhenInUseAuthorization()
                   }
        locationUpdates = true

        locationManager.startUpdatingLocation()
        if #available(iOS 9.0, *) {
            
            locationManager.allowsBackgroundLocationUpdates  = false
        } else {
            // Fallback on earlier versions
        }
//        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(locationManagerClass.updateLocationToServer), userInfo: nil, repeats: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // If it's a relatively recent event, turn off updates to save power.
        let location: CLLocation = locations.last!
        UserDefaults.standard.set("\(location.coordinate.latitude)", forKey: "lat")
        UserDefaults.standard.set("\(location.coordinate.longitude)", forKey: "long")
        UserDefaults.standard.synchronize()
      
    }
    
    func stopStandardUpdate(){
        DispatchQueue.main.async  {
            self.timer.invalidate()
        }
        if #available(iOS 9.0, *) {
            locationManager.allowsBackgroundLocationUpdates = false
        } else {
            // Fallback on earlier versions
        }
        locationUpdates = false
        locationManager.stopUpdatingLocation()
    }
    
    
    //MARK:- WHEN DENIED
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.denied {
            UserDefaults.standard.set("\(0.0)", forKey: "lat")
            UserDefaults.standard.set("\(0.0)", forKey: "long")
            
            self.generateAlertToNotifyUser()
        }else if status == CLAuthorizationStatus.authorizedAlways ||  status == CLAuthorizationStatus.authorizedWhenInUse  {
//            let location: CLLocation = locationManager.location!
//            UserDefaults.standard.set("\(location.coordinate.latitude)", forKey: "lat")
//            UserDefaults.standard.set("\(location.coordinate.longitude)", forKey: "long")
//            UserDefaults.standard.synchronize()
//            NotificationCenter.default.post(name: NSNotification.Name("LocationOn"), object: nil)
            
        }
    }
    
    func generateAlertToNotifyUser() {
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.notDetermined{
            
            var title: String
            title = ""
            let message: String = "Location Services are not able to determine your location"
            
            let alertView: UIAlertView = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Settings")
            alertView.show()
        }
        
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.denied{
            
            var title: String
            
            title = "Location services are off"
            let message: String = "To use this service efficiently, you must turn on Location Services from Settings"
            
            let alertView: UIAlertView = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Settings")
            alertView.show()
        }
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.notDetermined
        {
            startStandardUpdates()
        }
    }
 
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
        if buttonIndex == 1 {
            // Send the user to the Settings for this app
            let settingsURL: URL = URL(string: UIApplicationOpenSettingsURLString)!
            UIApplication.shared.openURL(settingsURL)
        }
        
    }
    
    
}

