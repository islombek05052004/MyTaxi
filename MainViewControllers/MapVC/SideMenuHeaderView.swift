//
//  SideMenuHeaderView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class SideMenuHeaderView: UIView {
    
    private let nameLabel = UILabel(text: "Islombek MyTaxi",
                                    font: .systemFont(ofSize: 22, weight: .regular))
    
    private let numberLabel = UILabel(text: "+998 (94) 013-25-05",
                                      font: .systemFont(ofSize: 17, weight: .regular))
    
    private let leftImage = UIImageView(image: UIImage(systemName: "person.circle.fill"),
                                        contentMode: .scaleAspectFit)
    
    private let rightImage = UIImageView(image: UIImage(systemName: "chevron.right"),
                                         contentMode: .scaleAspectFit)
    
    private let headerBtn = UIButton()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        toFormUIElements()
    }    
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SideMenuHeaderView {
    
    private func toFormUIElements() {
        
        let titleStackView = UIStackView(
            arrangedSubviews: [nameLabel, numberLabel],
            axis: .vertical,
            spacing: 5
        )
        
        let finalStackView = UIStackView(
            arrangedSubviews: [leftImage, titleStackView, rightImage],
            axis: .horizontal,
            spacing: 10
        )
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        finalStackView.alignment = .center

        
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        leftImage.widhtHeight(50, 50)
        leftImage.tintColor = .gray
        leftImage.clipsToBounds = true
        leftImage.layer.cornerRadius = 25
        
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        rightImage.widhtHeight(30, 30)
        rightImage.tintColor = .gray
        
        headerBtn.backgroundColor = .clear
        headerBtn.translatesAutoresizingMaskIntoConstraints = false
        
        headerBtn.addTarget(nil,
                            action: #selector(MapHomeViewController.accoundHeaderViewTapped),
                            for: .touchUpInside)
        
        addSubview(finalStackView)
        addSubview(headerBtn)
        
        finalStackView.bottomAnchor(bottomAnchor, -15)
        finalStackView.leftAnchor(leftAnchor, 10)
        finalStackView.rightAnchor(rightAnchor, -10)
        
        headerBtn.topAnchor(topAnchor, 0)
        headerBtn.leftAnchor(leftAnchor, 0)
        headerBtn.rightAnchor(rightAnchor, 0)
        headerBtn.bottomAnchor(bottomAnchor, 0)
    }
    
    func updateInformationHeaderView() {
        
        let dataAccountImage = UserDefaultsManager.shared.getAccountImageData()
        let dataAccount = UserDefaultsManager.shared.getAccoundData()
        
        
        DispatchQueue.main.async {
            self.nameLabel.text = dataAccount?.name 
            self.numberLabel.text = dataAccount?.number
            
            if let accountImage = dataAccountImage {
                self.leftImage.image = accountImage
            }
        }
    }
}
