//
//  UIImageView+.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 12/01/24.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode, clipBounds: Bool = true) {
        
        self.init()
        self.image = image
        self.contentMode = contentMode
        self.clipsToBounds = clipBounds
    }
    
}
