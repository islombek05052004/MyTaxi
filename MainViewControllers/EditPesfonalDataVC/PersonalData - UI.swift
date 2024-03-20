//
//  PersonalData - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 31/01/24.
//

import UIKit

private let textBackColor: UIColor = .clear
private let labelFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
private let textFieldfont: UIFont = .systemFont(ofSize: 17, weight: .semibold)

final class PersonalDataVCView: UIView {
    
    private let currentData = UserDefaultsManager.shared.getAccoundData()
    
    private let nameLabel = UILabel(text: "Ism",
                                    textColor: .gray,
                                    font: labelFont)
    
    private let surnameLabel = UILabel(text: "Familiya",
                                       textColor: .gray,
                                       font: labelFont)
        
    private let birthdayLabel = UILabel(text: "Tug'ilgan sana",
                                        textColor: .gray,
                                        font: labelFont)
    
    private let genderLabel = UILabel(text: "Jins",
                                      textColor: .gray,
                                      font: labelFont)
    
    let nameTF = UITextField(backColor: textBackColor,
                             placeholder: "Ismingiz",
                             font: textFieldfont,
                             borderStyle: .none)
    
    let surnameTF = UITextField(backColor: textBackColor,
                                placeholder: "Familiyangiz",
                                font: textFieldfont,
                                borderStyle: .none)
    
    let birthdayTF = UITextField(backColor: textBackColor,
                                 placeholder: "KK.OO.YYYY",
                                 font: textFieldfont,
                                 borderStyle: .none)
    
    let dataBtn = UIButton()
    
    let saveBtn = UIButton(title: "Saqlab qo'yish",
                           textColor: .black,
                           backColor: .systemYellow,
                           font: .systemFont(ofSize: 17, weight: .semibold))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        toFormUIElements()
        setDataToViewElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PersonalDataVCView {
    
    private func setDataToViewElements() {
        
        if let currentData = currentData {
            
            nameTF.text = currentData.name
            surnameTF.text = currentData.surname
            birthdayTF.text = currentData.birthday
        }
    }
    
    private func toFormUIElements() {
                
        let nameView = CustomTextFieldView(textField: nameTF,
                                           leftView: nil,
                                           rightView: nil)
        
        let surnameView = CustomTextFieldView(textField: surnameTF,
                                              leftView: nil,
                                              rightView: nil)
        
        let birthdayView = CustomTextFieldView(textField: birthdayTF,
                                               leftView: nil,
                                               rightView: dataBtn)

        let finalStackView = UIStackView(
            arrangedSubviews: [nameLabel, nameView,
                               surnameLabel, surnameView,
                               birthdayLabel, birthdayView],
            axis: .vertical,
            spacing: 10
        )
        
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        
        birthdayTF.isEnabled = false
        
        dataBtn.backgroundColor = .systemGray3
        dataBtn.setImage(UIImage(systemName: "calendar"), for: .normal)
        dataBtn.tintColor = .gray
        
        addSubview(finalStackView)
        addSubview(saveBtn)
        
        saveBtn.leftAnchor(leftAnchor, 20)
        saveBtn.rightAnchor(rightAnchor, -20)
        saveBtn.bottomAnchor(self.safeAreaLayoutGuide.bottomAnchor, -20)
        saveBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        finalStackView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 20)
        finalStackView.leftAnchor(self.leftAnchor, 20)
        finalStackView.rightAnchor(self.rightAnchor, -20)
    }
}
