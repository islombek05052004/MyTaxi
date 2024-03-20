//
//  CustomAnnotationView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 02/02/24.
//
//
//import UIKit
//import Mapbox
//
//class CustomAnnotationView: MGLAnnotationView {
//    
//    var imageView: UIImageView!
//    init(reuseIdentifier: String?, image: UIImage) {
//        super.init(reuseIdentifier: reuseIdentifier)
//        
//        self.imageView = UIImageView(image: image)
//        self.imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
//        self.addSubview(imageView)
//        self.frame = self.imageView.frame
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
