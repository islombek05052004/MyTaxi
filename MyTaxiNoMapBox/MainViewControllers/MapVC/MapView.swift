//
//  MapView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 31/01/24.
//

//import UIKit
//import Mapbox
//
//class MapView: UIView {
//        
//    init(mapViewHome: MGLMapView) {
//        super.init(frame: .zero)
//        
//        let styleUrl = "mapbox://styles/mapbox/outdoors-v12"
//
//        addSubview(mapViewHome)
//        
//        mapViewHome.clipsToBounds = true
//        mapViewHome.styleURL = URL(string: styleUrl)
//        mapViewHome.setUserTrackingMode(.follow, animated: true)
//        mapViewHome.setCenter(LocationManager.shared.coordinate, zoomLevel: Double(17.0),
//                          animated: false)
//        mapViewHome.style?.localizeLabels(into: Locale(identifier: "es"))
//        
////        mapViewHome.showsUserLocation = true
//        mapViewHome.allowsTilting = false
//        mapViewHome.logoView.isHidden = true
//        mapViewHome.allowsRotating = false
//        mapViewHome.minimumZoomLevel = 3
//        mapViewHome.maximumZoomLevel = 20
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }    
//}
