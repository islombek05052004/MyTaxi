//
//  UIButton+.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 12/01/24.
//

import UIKit


extension UIButton {
    
    convenience init(
        title: String?,
        textColor: UIColor = .black,
        backColor: UIColor,
        font: UIFont? = .usualFont20(),
        border: Bool = false,
        textAlignment: NSTextAlignment = .center,
        cornerRadius: CGFloat = 15
    ) {
        
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = backColor
        self.titleLabel?.font = font
        self.titleLabel?.textAlignment = textAlignment
        self.layer.cornerRadius = cornerRadius
        
        if border {
            
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    
    enum typeLanguage: Int {
        case uzb = 0
        case rus = 1
        case eng = 2
    }
    
    static func languageBtn(type: typeLanguage) -> UIButton {
        let btn = UIButton()
        btn.tag = type.rawValue
        return btn
    }
}
