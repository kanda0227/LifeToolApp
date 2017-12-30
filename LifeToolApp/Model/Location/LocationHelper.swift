//
//  LocationHelper.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/24.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import CoreLocation

final class LocationHelper: NSObject, CLLocationManagerDelegate {
    
    public static let shared = LocationHelper()
    
    private var locationManager: CLLocationManager!
    private var completion: (CLLocation) -> Void = { _ in }
    
    /// 現在地を取得します
    public func requestLocationXY(completion: @escaping (CLLocation) -> Void) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            self.completion = completion
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        
        completion(newLocation)
        manager.stopUpdatingLocation()
    }
}
