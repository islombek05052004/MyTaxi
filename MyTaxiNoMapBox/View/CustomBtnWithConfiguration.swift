//
//  CustomBtnWithConfiguration.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 11/02/24.
//

import UIKit

class CustomBtnWithConfiguration: UIButton {
    
    init(backColor: UIColor,
         iconImage: UIImage?,
         targetSizeOffIcon: CGSize = CGSize(width: 45, height: 45),
         title: String,
         config: UIButton.Configuration?,
         cornerStyle: UIButton.Configuration.CornerStyle,
         imagePlacement: NSDirectionalRectEdge,
         baseForegroundColor: UIColor = .black,
         font: UIFont? = nil,
         contentInsets: NSDirectionalEdgeInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
    ) {
        super.init(frame: .zero)
        
        let iconImage = iconImage?.scalePreservingAspectRatio(targetSize: targetSizeOffIcon)
        
        var config = config
        config?.baseBackgroundColor = backColor
        config?.baseForegroundColor = baseForegroundColor
        config?.image = iconImage
        config?.contentInsets = contentInsets
        config?.imagePadding = 10
        config?.imagePlacement = imagePlacement
        config?.titleLineBreakMode = .byWordWrapping
        config?.cornerStyle = cornerStyle
        
        self.configuration = config
        self.titleLabel?.textAlignment = .center
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


