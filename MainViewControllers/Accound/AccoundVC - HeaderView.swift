//
//  AccoundVC - TableHeaderView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit

class AccoundTableHeaderView: UIView {
    
    private let imagePerson = UIImageView(
        image: UIImage(named: "userAccoundImage")?.withTintColor(.systemGray3),
        contentMode: .scaleAspectFill
    )
    
    private let accoundName = UILabel(
        text: "Islombek MyTaxi",
        textAlignment: .center,
        font: .systemFont(ofSize: 20, weight: .semibold)
    )
    
    private let surnameLabel = UILabel(
        text: "",
        textAlignment: .center,
        font: .systemFont(ofSize: 20, weight: .semibold)
    )
    
    private let changeImageAccoundBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        changeImageAccoundBtn.addTarget(nil,
                                        action: #selector(AccountViewController().accountImageTapped),
                                        for: .touchUpInside)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccoundTableHeaderView {
    
    func updateHeaderElements() {
        
        if let accountImage = UserDefaultsManager.shared.getAccountImageData() {
            self.imagePerson.image = accountImage
        }
        if let accountData = UserDefaultsManager.shared.getAccoundData() {
            self.accoundName.text = accountData.name
            self.surnameLabel.text = accountData.surname
        }
    }
}

extension AccoundTableHeaderView {
    
    private func toFormUIElements() {
                        
        let accoundData = UserDefaultsManager.shared.getAccoundData()
        
        let labelStackView = UIStackView(
            arrangedSubviews: [accoundName, surnameLabel],
            axis: .vertical,
            spacing: 5
        )
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        accoundName.text = accoundData?.name
        surnameLabel.text = accoundData?.surname
        
        imagePerson.clipsToBounds = true
        imagePerson.layer.cornerRadius = 50
        imagePerson.tintColor = .gray
        imagePerson.translatesAutoresizingMaskIntoConstraints = false

        changeImageAccoundBtn.backgroundColor = .clear
        changeImageAccoundBtn.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imagePerson)
        addSubview(changeImageAccoundBtn)
        addSubview(labelStackView)

        imagePerson.centerXAnchor(self.centerXAnchor, 0)
        imagePerson.topAnchor(topAnchor, 20)
        imagePerson.widhtHeight(100, 100)
        
        changeImageAccoundBtn.centerYAnchor(imagePerson.centerYAnchor, 0)
        changeImageAccoundBtn.centerXAnchor(imagePerson.centerXAnchor, 0)
        changeImageAccoundBtn.widhtHeight(100, 100)
        
        labelStackView.topAnchor(changeImageAccoundBtn.bottomAnchor, 10)
        labelStackView.leftAnchor(self.leftAnchor, 0)
        labelStackView.rightAnchor(self.rightAnchor, 0)
    }
}


