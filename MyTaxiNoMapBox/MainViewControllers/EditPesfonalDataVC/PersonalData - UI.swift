//
//  PersonalData - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 31/01/24.
//

import UIKit

private let textBackColor: UIColor = .clear
private let fontSize: CGFloat = 18

final class PersonalDataVCView: UIView {
    
    private let currentData = UserDefaultsManager.shared.getAccoundData()
    
    private let nameLabel = UILabel(text: "Ism",
                                    textColor: .gray,
                                    font: .systemFont(ofSize: fontSize, weight: .regular))
    
    private let surnameLabel = UILabel(text: "Familiya",
                                       textColor: .gray,
                                       font: .systemFont(ofSize: fontSize, weight: .regular))
    
    private let emailLabel = UILabel(text: "Elektron manzil",
                                     textColor: .gray,
                                     font: .systemFont(ofSize: fontSize, weight: .regular))
    
    private let birthdayLabel = UILabel(text: "Tug'ilgan sana",
                                        textColor: .gray,
                                        font: .systemFont(ofSize: fontSize, weight: .regular))
    
    private let genderLabel = UILabel(text: "Jins",
                                      textColor: .gray,
                                      font: .systemFont(ofSize: fontSize, weight: .regular))
    
    let nameTF = UITextField(backColor: textBackColor,
                                     placeholder: "Ismingiz",
                                     borderStyle: .none)
    
    let surnameTF = UITextField(backColor: textBackColor,
                                        placeholder: "Familiyangiz",
                                        borderStyle: .none)
    
    let emailTF = UITextField(backColor: textBackColor,
                                      placeholder: "Elektron manzilingiz",
                                      borderStyle: .none)

    
    let birthdayTF = UITextField(backColor: textBackColor,
                                         placeholder: "KK.OO.YYYY",
                                         borderStyle: .none)
    
    let saveBtn = UIButton(title: "Saqlab qo'yish",
                           textColor: .white,
                           backColor: .systemYellow,
                           font: .systemFont(ofSize: 22, weight: .regular))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
            emailTF.text = currentData.email
        }
    }
    
    private func toFormUIElements() {
                
        let nameView = PersonalDataCustomView(label: nameLabel, textField: nameTF)
        let surnameView = PersonalDataCustomView(label: surnameLabel, textField: surnameTF)
        let emailView = PersonalDataCustomView(label: emailLabel, textField: emailTF)
        let birthdayView = PersonalDataCustomView(label: birthdayLabel, textField: birthdayTF)

        let finalStackView = UIStackView(
            arrangedSubviews: [nameView, surnameView, emailView, birthdayView],
            axis: .vertical,
            spacing: 20
        )
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        
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
