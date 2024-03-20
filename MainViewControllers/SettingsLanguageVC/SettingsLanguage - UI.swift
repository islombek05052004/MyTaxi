//
//  SettingsLanguage - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 10/02/24.
//

import UIKit


final class SettingsLanguageVCHomeView: UIView {
    
    private let firstLineView = UIView()
    private let secondLineView = UIView()
    
    var rusButtonView = SettingsLanguageCustomBtnView(btnType: .russian, selected: false)
    var engButtonView = SettingsLanguageCustomBtnView(btnType: .english, selected: false)
    var uzbButtonView = SettingsLanguageCustomBtnView(btnType: .uzbek, selected: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray6
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsLanguageVCHomeView  {
    
    private func toFormUIElements() {

        let mainStackView = UIStackView(
            arrangedSubviews: [uzbButtonView, firstLineView, rusButtonView, secondLineView, engButtonView],
            axis: .vertical,
            spacing: 5
        )
        
        firstLineView.translatesAutoresizingMaskIntoConstraints = false
        firstLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        firstLineView.backgroundColor = .systemGray4
        
        secondLineView.translatesAutoresizingMaskIntoConstraints = false
        secondLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        secondLineView.backgroundColor = .systemGray4
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        mainStackView.leftAnchor(leftAnchor, 20)
        mainStackView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 20)
        mainStackView.rightAnchor(rightAnchor, -20)
        mainStackView.clipsToBounds = true
        mainStackView.layer.cornerRadius = 10
        mainStackView.backgroundColor = .white
    }
}
