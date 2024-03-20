//
//  CustomTextFieldView.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 12/02/24.
//

import UIKit
 
class CustomTextFieldView : UIView {
    
    init(textField: UITextField,
         leftView: UIView?,
         rightView: UIView?,
         height: CGFloat = 50
    ) {
        super.init(frame: .zero)
        toFormUIElements(textField: textField, leftView: leftView, rightView: rightView)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTextFieldView {
    
    private func toFormUIElements(
        textField: UITextField,
        leftView: UIView?,
        rightView: UIView?,
        backColor: UIColor = .systemGray6
    ) {
        
        let mainStackView = UIStackView(
            arrangedSubviews: [],
            axis: .horizontal,
            spacing: 10
        )
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        if let leftView = leftView {
            leftView.translatesAutoresizingMaskIntoConstraints = false
            leftView.widhtHeight(35, 35)
            leftView.clipsToBounds = true
            leftView.backgroundColor = .systemGray5
            leftView.layer.cornerRadius = 10
            mainStackView.addArrangedSubview(leftView)
        }
        
        mainStackView.addArrangedSubview(textField)
        
        if let rightView = rightView {
            rightView.translatesAutoresizingMaskIntoConstraints = false
            rightView.widhtHeight(35, 35)
            rightView.clipsToBounds = true
            rightView.backgroundColor = .systemGray5
            rightView.layer.cornerRadius = 10
            mainStackView.addArrangedSubview(rightView)
        }
        
        addSubview(mainStackView)
        
        mainStackView.centerYAnchor(self.centerYAnchor, 0)
        mainStackView.leftAnchor(self.leftAnchor, 10)
        mainStackView.rightAnchor(self.rightAnchor, -5)
        
        self.clipsToBounds = true
        self.backgroundColor = backColor
        self.layer.cornerRadius = 10
    }
}
