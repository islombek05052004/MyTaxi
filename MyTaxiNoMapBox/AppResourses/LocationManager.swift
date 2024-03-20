//
//  LocationManager.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 31/01/24.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject {
    
    private var locationManager: CLLocationManager?
    
    var coordinate: CLLocationCoordinate2D = .init(latitude: 41.1, longitude: 69.1)
    static let shared = LocationManager()
    
    func requestLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(
    _ manager: CLLocationManager,
    didChangeAuthorization status: CLAuthorizationStatus
    ) {
//        if status == .authorizedAlways {
            coordinate = manager.location?.coordinate ?? .init(latitude: 41.1, longitude: 69.1)
            print(coordinate.latitude)
//        }
    }
}
