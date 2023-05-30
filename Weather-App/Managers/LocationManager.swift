//
//  LocationManager.swift
//  Weather-App
//
//  Created by Usman on 30/05/2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    
}

extension LocationManager {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    //Handle errors
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting locations", error)
        isLoading = false
    }
}
