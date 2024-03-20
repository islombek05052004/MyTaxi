//
//  Settings - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 10/02/24.
//

import UIKit


final class SettingsVCHomeView: UIView {
    
    private let lineView = UIView()
    var languageButton = SettingsCustomButton(selector: nil, typeButton: .language)
    var contractButton = SettingsCustomButton(selector: nil, typeButton: .contract)
    let exitAccountButton = UIButton(title: "Chiqish",
                                     textColor: .red,
                                     backColor: .white,
                                     font: .systemFont(ofSize: 14, weight: .regular))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}

extension SettingsVCHomeView {
    
    private func toFormUIElements() {
        
        let mainStackView = UIStackView(
            arrangedSubviews: [languageButton, lineView, contractButton],
            axis: .vertical,
            spacing: 5
        )
        mainStackView.clipsToBounds = true
        mainStackView.layer.cornerRadius = 10
        mainStackView.backgroundColor = .white
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.backgroundColor = .systemGray5
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        addSubview(mainStackView)
        addSubview(exitAccountButton)
        
        exitAccountButton.frame = CGRect(x: 20,
                                         y: Paddings.deviceBounds.height - 100,
                                         width: Paddings.deviceBounds.width - 40,
                                         height: 50)
        
        mainStackView.leftAnchor(leftAnchor, 20)
        mainStackView.rightAnchor(rightAnchor, -20)
        mainStackView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 20)
    }
}
