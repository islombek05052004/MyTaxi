//
//  UIColor.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 12/01/24.
//

import UIKit

extension UIColor {
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
