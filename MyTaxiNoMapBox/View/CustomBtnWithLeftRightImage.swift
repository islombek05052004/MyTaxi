//
//  CustomBtnWithLeftRightImage.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 21/02/24.
//

import UIKit

class CustomBtnWithLeftRightImage: UIButton {
    
    init(
        leftImage: UIImage?,
        leftImageColor: UIColor = .gray,
        title: String,
        titleColor: UIColor = .black,
        font: UIFont? = .systemFont(ofSize: 20, weight: .regular),
        rightImage: UIImage?,
        rightImageColor: UIColor = .gray,
        backColor: UIColor = .white,
        cornerRadius: CGFloat = 0,
        contentContainer: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
        contentItemSpace: CGFloat = 20
    ) {
        super.init(frame: .zero)
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        
        let titleLabel = UILabel(text: title, textColor: titleColor, font: font)
        
        let rightImageView = UIImageView(
            image: rightImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30)).withRenderingMode(.alwaysTemplate),
            contentMode: .scaleAspectFit
        )
        rightImageView.tintColor = rightImageColor
        
        let leftImageView = UIImageView(
            image: leftImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30)).withRenderingMode(.alwaysTemplate),
            contentMode: .scaleAspectFit
        )
        leftImageView.tintColor = leftImageColor

        let mainStackView = UIStackView(
            arrangedSubviews: [leftImageView, titleLabel, rightImageView],
            axis: .horizontal,
            spacing: contentItemSpace
        )
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.backgroundColor = .clear
        
        addSubview(mainStackView)
        mainStackView.leftAnchor(leftAnchor, 0)
        mainStackView.topAnchor(topAnchor, 0)
        mainStackView.rightAnchor(rightAnchor, 0)
        mainStackView.bottomAnchor(bottomAnchor, 0)
        
        mainStackView.layoutMargins = contentContainer
        mainStackView.isLayoutMarginsRelativeArrangement = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
