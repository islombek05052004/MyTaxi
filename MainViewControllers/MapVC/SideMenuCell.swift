//
//  SideMenuCell.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    private let title = UILabel(text: nil, font: .systemFont(ofSize: 20, weight: .semibold))
    
    private let subtitle = UILabel(text: nil,
                                   textColor: .gray,
                                   font: .systemFont(ofSize: 17, weight: .semibold))
    
    private let rightImage = UIImageView(image: nil,
                                         contentMode: .scaleAspectFit)
    
    private var finalStackView = UIStackView(arrangedSubviews: [],
                                             axis: .horizontal,
                                             spacing: 10)
    
    private var titleStackView = UIStackView(arrangedSubviews: [],
                                             axis: .vertical,
                                             spacing: 5)
    
    static let identifier = "SideMenuCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        toFormUIElements()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SideMenuCell {
    
    func setDataToCell(data: SideMenuDataModel) {
        
        title.text = nil
        subtitle.text = nil
        rightImage.image = nil
        
        title.text = data.title
        subtitle.isHidden = true
        
        if let subtitleText = data.subtitle {
            subtitle.isHidden = false
            subtitle.text = subtitleText
        }
        
        if let rightImageName = data.rightImage {
            rightImage.image = UIImage(named: rightImageName)
        }
    }
}

extension SideMenuCell {
    
    private func toFormUIElements() {
            
        titleStackView.addArrangedSubview(title)
        titleStackView.addArrangedSubview(subtitle)
        finalStackView.addArrangedSubview(titleStackView)
        finalStackView.addArrangedSubview(rightImage)

        rightImage.translatesAutoresizingMaskIntoConstraints = false
        rightImage.widhtHeight(35, 35)
        rightImage.clipsToBounds = true
        
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        finalStackView.alignment = .center
        
        contentView.addSubview(finalStackView)
        finalStackView.leftAnchor(contentView.leftAnchor, 10)
        finalStackView.rightAnchor(contentView.rightAnchor, -10)
        finalStackView.topAnchor(contentView.topAnchor, 15)
        finalStackView.bottomAnchor(contentView.bottomAnchor, -15)

        contentView.bottomAnchor(self.finalStackView.bottomAnchor, 15)

    }
}
