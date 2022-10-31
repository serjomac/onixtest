//
//  LocationPermissonViewModel.swift
//  onixtest
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import CoreLocation

class LocationPermissonViewModel {
    
    var router: LocationPermissonRouter?
    
    init() {
        self.router = LocationPermissonRouter(viewModel: self)
    }
    
    func verifyLocationPermisson() -> Bool {
        let locationManager = CLLocationManager()
        //locationManager.delegate = self
        let autorizationStatus = CLLocationManager.authorizationStatus()
        switch autorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                return true
            case .restricted, .denied:  // Location services currently unavailable.
                return false
            case .notDetermined:        // Authorization not determined yet.
            locationManager.requestWhenInUseAuthorization()
            return false
            default:
                return false
            }
    }
}
