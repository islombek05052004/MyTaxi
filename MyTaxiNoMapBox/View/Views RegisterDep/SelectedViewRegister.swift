//
//  SelectedViewRegister.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 12/01/24.
//

import UIKit
//
//class SelectedRegisterView: UIView {
//
//    var select: Bool = false
//
//    init(image: UIImage?, text: String, button: UIButton, selected: Bool = false) {
//        super.init(frame: .zero)
//
//        var selected = selected
//        let imageView = UIImageView(image: image, contentMode: .scaleToFill)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(imageView)
//
//        imageView.leftAnchor(self.leftAnchor, 20)
//        imageView.centerYAnchor(self.centerYAnchor, 0)
//        imageView.widhtHeight(30, 42)
//
//        self.backgroundColor = .white
//
//        let titleLabel = UILabel(text: text)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(titleLabel)
//
//        titleLabel.leftAnchor(imageView.rightAnchor, 20)
//        titleLabel.rightAnchor(self.rightAnchor, -20)
//        titleLabel.centerYAnchor(self.centerYAnchor, 0)
//
//
//        self.layer.cornerRadius = 12
//
//
//        self.clipsToBounds = true
//        button.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(button)
//        button.leftAnchor(self.leftAnchor, 0)
//        button.rightAnchor(self.rightAnchor, 0)
//        button.topAnchor(self.topAnchor, 0)
//        button.bottomAnchor(self.bottomAnchor, 0)
//
//        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}

class SelectedRegisterView: UIView {
    
    init(image: UIImage?, text: String, button: UIButton) {
        super.init(frame: .zero)
                
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let imageView = UIImageView(image: image, contentMode: .scaleToFill)
        let titleLabel = UILabel(text: text)
        let imageLabelStackView = UIStackView(
            arrangedSubviews: [imageView, titleLabel],
            axis: .horizontal,
            spacing: 20
        )
        
        button.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageLabelStackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageLabelStackView)
        addSubview(button)

        imageView.widhtHeight(30, 42)
        
        imageLabelStackView.centerYAnchor(self.centerYAnchor, 0)
        imageLabelStackView.leftAnchor(self.leftAnchor, 20)
        imageLabelStackView.rightAnchor(self.rightAnchor, -20)
        
        button.leftAnchor(self.leftAnchor, 0)
        button.rightAnchor(self.rightAnchor, 0)
        button.topAnchor(self.topAnchor, 0)
        button.bottomAnchor(self.bottomAnchor, 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
