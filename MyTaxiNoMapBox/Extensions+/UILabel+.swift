//
//  UILabel+.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 12/01/24.
//

import UIKit

extension UILabel {
    
    convenience init(
        text: String?,
        textColor: UIColor = .black,
        textAlignment: NSTextAlignment = .left,
        font: UIFont? = .usualFont20(),
        backColor: UIColor = .clear
    ) {

        self.init()
        self.backgroundColor = backColor
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
    }    
}
