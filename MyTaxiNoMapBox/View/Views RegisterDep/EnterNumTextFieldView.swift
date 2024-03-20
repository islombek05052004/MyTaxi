//
//  EnterNumTextFieldView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 13/01/24.
//

import UIKit

class EnterNumTextFieldView: UIView {
    
    
    init(
        imageView: UIImageView,
        buttonFlag: UIButton,
        codeCountyLabel: UILabel,
        textField: UITextField
    ) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 60).isActive =  true
        self.backgroundColor = .systemGray6
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        let lineView = UIView()
        lineView.backgroundColor = .systemGray4
        
        let flagCounrtyStackView = UIStackView(
            arrangedSubviews: [imageView, buttonFlag],
            axis: .horizontal,
            spacing: 10
        )
        let numTextFieldStackView = UIStackView(
            arrangedSubviews: [codeCountyLabel, textField],
            axis: .horizontal,
            spacing: 10
        )
        
        let finalStackView = UIStackView(
            arrangedSubviews: [flagCounrtyStackView, lineView, numTextFieldStackView],
            axis: .horizontal,
            spacing: 15
        )
        
        buttonFlag.setImage(UIImage(systemName: "chevron.down"), for: .normal)

        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false

        lineView.widhtHeight(1, 60)
        
        addSubview(finalStackView)

        finalStackView.leftAnchor(self.leftAnchor, 10)
        finalStackView.centerYAnchor(self.centerYAnchor, 0)
        
        imageView.widhtHeight(40, 60)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
