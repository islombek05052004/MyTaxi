//
//  StackView+.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 12/01/24.
//

import UIKit

extension UIStackView {
    
    convenience init
    (
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat,
        contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) {
        
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.layoutMargins = contentInsets
        self.isLayoutMarginsRelativeArrangement = true
    }
    
}
