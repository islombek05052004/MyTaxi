//
//  SettingsCustomButton.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 10/02/24.
//

import UIKit

enum SettingsBtnType {
    
    case language
    case contract
}

class SettingsCustomButtonView: UIView {
    
    private let titleLabelOffButton = UILabel(text: nil,
                                              font: .systemFont(ofSize: 17, weight: .regular))
    
    private let descripctionLabel = UILabel(text: nil,
                                            textColor: .systemGray2,
                                            font: .systemFont(ofSize: 14, weight: .regular))
    
    private let nextImageView = UIImageView(image: UIImage(named: "right")?.withRenderingMode(.alwaysTemplate),
                                            contentMode: .scaleAspectFit)
    
    private let mainStackView = UIStackView(arrangedSubviews: [],
                                            axis: .horizontal,
                                            spacing: 5)

    var btn = UIButton()
    
    init(typeButton: SettingsBtnType) {
        super.init(frame: .zero)
        toFormUIElements()
        formButtonWith(type: typeButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsCustomButtonView {
    
    private func toFormUIElements() {
        backgroundColor = .clear

        nextImageView.translatesAutoresizingMaskIntoConstraints = false
        nextImageView.widhtHeight(30, 30)
        nextImageView.tintColor = .systemGray4
    }
    
    func formButtonWith(type: SettingsBtnType) {
        
        mainStackView.addArrangedSubview(titleLabelOffButton)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        setDataToButton(type: type)
        
        switch type {
            
        case .language:
            mainStackView.addArrangedSubview(descripctionLabel)
            mainStackView.addArrangedSubview(nextImageView)
        case .contract:
            mainStackView.addArrangedSubview(nextImageView)
        }
        
        addSubview(mainStackView)
        addSubview(btn)

        mainStackView.leftAnchor(leftAnchor, 10)
        mainStackView.topAnchor(topAnchor, 10)
        mainStackView.rightAnchor(rightAnchor, -10)
        mainStackView.bottomAnchor(bottomAnchor, -10)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.leftAnchor(leftAnchor, 0)
        btn.rightAnchor(rightAnchor, 0)
        btn.topAnchor(topAnchor, 0)
        btn.bottomAnchor(bottomAnchor, 0)
    }
    
    private func setDataToButton(type: SettingsBtnType) {
        
        switch type {
        case .language:
            titleLabelOffButton.text = "Til"
            descripctionLabel.text = "O'zbekcha"
        case .contract:
            titleLabelOffButton.text = "Foydalanuvchi shartnomasi"
        }
    }
}
