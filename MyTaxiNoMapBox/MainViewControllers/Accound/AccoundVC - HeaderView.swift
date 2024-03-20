//
//  AccoundVC - TableHeaderView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit

enum AccoundTableHeaderViewTags: Int, CaseIterable {
    
    case imagePerson = 100
    case changeImageAccoundBtn = 101
    case accoundName = 102
}

class AccoundTableHeaderView: UIView {
    
    private let imagePerson = UIImageView(
        image: UIImage(named: "userAccoundImage")?.withTintColor(.systemGray3),
        contentMode: .scaleAspectFill
    )
    
    private let accoundName = UILabel(
        text: "Islombek MyTaxi",
        textAlignment: .center,
        font: .systemFont(ofSize: 30, weight: .regular)
    )
    
    private let changeImageAccoundBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
            self.accoundName.text = accountData.name + (accountData.surname ?? "")
        }
    }
}

extension AccoundTableHeaderView {
    
    private func toFormUIElements() {
                
        let tags = AccoundTableHeaderViewTags.self
        
        let accoundData = UserDefaultsManager.shared.getAccoundData()
        
        accoundName.text = accoundData?.name
        
        imagePerson.tag = tags.imagePerson.rawValue
        changeImageAccoundBtn.tag = tags.changeImageAccoundBtn.rawValue
        accoundName.tag = tags.accoundName.rawValue
        
        imagePerson.clipsToBounds = true
        imagePerson.layer.cornerRadius = 50
        imagePerson.tintColor = .gray
        
        changeImageAccoundBtn.backgroundColor = .clear
        
        accoundName.numberOfLines = 2

        addSubview(imagePerson)
        addSubview(changeImageAccoundBtn)
        addSubview(accoundName)
        
        imagePerson.translatesAutoresizingMaskIntoConstraints = false
        changeImageAccoundBtn.translatesAutoresizingMaskIntoConstraints = false
        accoundName.translatesAutoresizingMaskIntoConstraints = false

        imagePerson.centerXAnchor(self.centerXAnchor, 0)
        imagePerson.topAnchor(topAnchor, 20)
        imagePerson.widhtHeight(100, 100)
        
        changeImageAccoundBtn.centerYAnchor(imagePerson.centerYAnchor, 0)
        changeImageAccoundBtn.centerXAnchor(imagePerson.centerXAnchor, 0)
        changeImageAccoundBtn.widhtHeight(100, 100)
        
        accoundName.topAnchor(changeImageAccoundBtn.bottomAnchor, 20)
        accoundName.centerXAnchor(changeImageAccoundBtn.centerXAnchor, 0)            
    }
    
}


