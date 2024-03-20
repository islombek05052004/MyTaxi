//
//  SettingsLanguageCustomBtnView.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 11/02/24.
//

import UIKit

enum SettingsLanguageCustomBtnViewType: Int {
    
    case english = 2
    case russian = 1
    case uzbek = 0
}

final class SettingsLanguageCustomBtnView: UIView {
    
    private var languageImageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private var languageLabel = UILabel(text: nil,
                                        font: .systemFont(ofSize: 16, weight: .semibold))
    private var rightImageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
    
    private var selected: Bool = false
    var languageBtn = UIButton()
    
    init(btnType: SettingsLanguageCustomBtnViewType, selected: Bool) {
        super.init(frame: .zero)
        
        self.selected = selected
        toFormUIElements(btnType: btnType)
        backgroundColor = .clear
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsLanguageCustomBtnView {
    
    private func toFormUIElements(btnType: SettingsLanguageCustomBtnViewType) {
        
        var languageimageName = ""
        var languageLabelText = ""
        let rightImageName = selected ? "checklist" : ""
        
        switch btnType {
            
        case .english:
            languageLabelText = "English (US)"
            languageimageName = "eng"
            languageBtn.tag = SettingsLanguageCustomBtnViewType.english.rawValue
            
        case .russian:
            languageLabelText = "Русский"
            languageimageName = "rus"
            languageBtn.tag = SettingsLanguageCustomBtnViewType.russian.rawValue

            
        case .uzbek:
            languageLabelText = "O'zbekcha"
            languageimageName = "uzb"
            languageBtn.tag = SettingsLanguageCustomBtnViewType.uzbek.rawValue

        }
        
        languageImageView.translatesAutoresizingMaskIntoConstraints = false
        languageImageView.widhtHeight(30, 30)
        languageImageView.image = UIImage(named: languageimageName)
        
        languageLabel.text = languageLabelText
        
        rightImageView.image = UIImage(named: rightImageName)
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.widhtHeight(30, 30)
        rightImageView.layer.cornerRadius = 15
        rightImageView.backgroundColor = .systemGray6
        
        
        let mainStackView = UIStackView(
            arrangedSubviews: [languageImageView, languageLabel, rightImageView],
            axis: .horizontal,
            spacing: 10
        )
        
        self.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leftAnchor(self.leftAnchor, 10)
        mainStackView.rightAnchor(self.rightAnchor, -10)
        mainStackView.topAnchor(self.topAnchor, 10)
        mainStackView.bottomAnchor(self.bottomAnchor, -10)
        mainStackView.backgroundColor = .clear
        
        self.addSubview(languageBtn)
        languageBtn.translatesAutoresizingMaskIntoConstraints = false
        languageBtn.leftAnchor(leftAnchor, 0)
        languageBtn.topAnchor(topAnchor, 0)
        languageBtn.rightAnchor(rightAnchor, 0)
        languageBtn.bottomAnchor(bottomAnchor, 0)
    }
    
    func languageIs(selected: Bool) {
        
        rightImageView.image = selected ? UIImage(named: "checklist") : UIImage(named: "")
    }
}
