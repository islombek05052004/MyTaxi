//
//  SideMenuHeaderView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class SideMenuHeaderCell: UITableViewCell {
    
    private let nameLabel = UILabel(text: "Islombek MyTaxi", font: .systemFont(ofSize: 22, weight: .regular))
    private let numberLabel = UILabel(text: "+998 (94) 013-25-05", textColor: .gray, font: .systemFont(ofSize: 17, weight: .regular))
    
    private let leftImage = UIImageView(image: UIImage(systemName: "person.circle.fill"),
                                        contentMode: .scaleAspectFit)
    private let rightImage = UIImageView(image: UIImage(systemName: "chevron.right"),
                                         contentMode: .scaleAspectFit)
    
    static let identifier = "SideMenuHeaderCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SideMenuHeaderCell {
    
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
        
        finalStackView.alignment = .center
        
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        leftImage.widhtHeight(50, 50)
        leftImage.tintColor = .gray
        leftImage.clipsToBounds = true
        leftImage.layer.cornerRadius = 25
        
        rightImage.widhtHeight(30, 30)
        rightImage.tintColor = .gray
        
        addSubview(finalStackView)
        
        finalStackView.topAnchor(topAnchor, 15)
        finalStackView.bottomAnchor(bottomAnchor, -15)
        finalStackView.leftAnchor(leftAnchor, 10)
        finalStackView.rightAnchor(rightAnchor, -10)
    }
}
