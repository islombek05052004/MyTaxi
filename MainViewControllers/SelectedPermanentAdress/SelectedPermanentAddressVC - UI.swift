//
//  SelectedPermanentVC - UI.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 12/02/24.
//

import UIKit

class SelectedPermanentAddressVCHomeView: UIView {
    
    let backButton = UIButton()
    
    let removeButton = UIButton(title: "O'chirish",
                                textColor: .red,
                                backColor: .clear,
                                font: .systemFont(ofSize: 17, weight: .semibold))
    
    private let nameLocationLabel = UILabel(text: "Nomi",
                                            textColor: .gray,
                                            font: .systemFont(ofSize: 15, weight: .semibold),
                                            backColor: .clear)
    
    private let addressLabel = UILabel(text: "Manzil",
                                       textColor: .gray,
                                       font: .systemFont(ofSize: 15, weight: .semibold),
                                       backColor: .clear)
    
    let nameAddressTF = UITextField(backColor: .clear,
                                     placeholder: "Sarlavha kiriting",
                                     font: .systemFont(ofSize: 19, weight: .semibold),
                                     borderStyle: .none)
    
    let addressTF = UITextField(backColor: .clear,
                                placeholder: nil,
                                font: .systemFont(ofSize: 19, weight: .semibold),
                                borderStyle: .none)
    
    let addressRightButton = UIButton()
    let nameAddressRightButton = UIButton()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomNavigationView()
        toFormUIElements()
        backgroundColor = .white

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectedPermanentAddressVCHomeView {
    
    private func setCustomNavigationView() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        let backButtonImage = UIImage(systemName: "arrow.left", withConfiguration: config)
        let titleLabel = UILabel(text: "Doimiy manzillar", font: .systemFont(ofSize: 18, weight: .semibold))

        let mainStackView = UIStackView(
            arrangedSubviews: [backButton, titleLabel, removeButton],
            axis: .horizontal,
            spacing: 10)
        
        mainStackView.alignment = .center
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.setImage(backButtonImage, for: .normal)
        backButton.tintColor = .gray
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widhtHeight(30, 30)
        
        self.addSubview(mainStackView)
        mainStackView.leftAnchor(self.leftAnchor, 20)
        mainStackView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 0)
        mainStackView.rightAnchor(self.rightAnchor, -20)
    }
    
    private func toFormUIElements()  {
        
        let nameAddressView = CustomTextFieldView(textField: nameAddressTF,
                                                   leftView: nil,
                                                   rightView: nameAddressRightButton)
        
        let addressView = CustomTextFieldView(textField: addressTF,
                                              leftView: nil,
                                              rightView: addressRightButton)
        
        addressTF.isEnabled = false
        
        nameAddressRightButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        nameAddressRightButton.tintColor = .gray
        
        addressRightButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        addressRightButton.tintColor = .gray

        let stackView = UIStackView(
            arrangedSubviews: [nameLocationLabel, nameAddressView,
                               addressLabel, addressView],
            axis: .vertical,
            spacing: 10
        )
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.leftAnchor(leftAnchor, 20)
        stackView.rightAnchor(rightAnchor, -20)
        stackView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 50)
    }
}
