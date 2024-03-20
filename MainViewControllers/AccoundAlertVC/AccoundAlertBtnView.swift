//
//  AccoundAlertBtnView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 30/01/24.
//

import UIKit

enum AccoundAlertBtnViewType {
    
    case phoneNumber
    case personalData
}

class AccoundAlertBtnView: UIView {
    
    let btn = UIButton()
    private let imageIcon = UIImageView()
    private let titleLabel = UILabel(text: nil, font: .systemFont(ofSize: 16, weight: .semibold))
    private let nextImage = UIImageView(image: UIImage(systemName: "chevron.compact.right"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        clipsToBounds = true
        layer.cornerRadius = 12
                
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}

extension AccoundAlertBtnView {
    
    func toFormUIView(with viewType: AccoundAlertBtnViewType) {
        
        switch viewType {
        case .phoneNumber:
            self.titleLabel.text = "Telefon raqami"
            self.imageIcon.image = UIImage(systemName: "phone.fill")
        case .personalData:
            self.titleLabel.text = "Shaxsiy ma'lumot"
            self.imageIcon.image = UIImage(systemName: "person.fill")
        }
    }    
}


extension AccoundAlertBtnView {
    
    private func toFormUIElements() {
        
        let stackView = UIStackView(
            arrangedSubviews: [imageIcon, titleLabel, nextImage],
            axis: .horizontal,
            spacing: 10
        )
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.widhtHeight(25, 25)

        nextImage.translatesAutoresizingMaskIntoConstraints = false
        nextImage.widhtHeight(25, 25)
        nextImage.tintColor = .gray

        btn.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        addSubview(btn)

        stackView.leftAnchor(leftAnchor, 20)
        stackView.rightAnchor(rightAnchor, -10)
        stackView.topAnchor(topAnchor, 10)
        stackView.bottomAnchor(bottomAnchor, -10)
        
        btn.leftAnchor(leftAnchor, 0)
        btn.rightAnchor(rightAnchor, 0)
        btn.bottomAnchor(bottomAnchor, 0)
        btn.topAnchor(topAnchor, 0)
    }
}
