//
//  CustomChildView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 12/01/24.
//

import UIKit

class CustomChildView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        
        layer.mask = shapeLayer
        
    }
}
