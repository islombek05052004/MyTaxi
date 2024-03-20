//
//  SideMenuCell.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    private let title = UILabel(text: nil, font: .systemFont(ofSize: 17, weight: .semibold))
    private let subtitle = UILabel(text: nil, textColor: .gray, font: .systemFont(ofSize: 14, weight: .semibold))
    private let rightImage = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private var finalStackView = UIStackView(arrangedSubviews: [], axis: .horizontal, spacing: 10)
    private var titleStackView = UIStackView(arrangedSubviews: [], axis: .vertical, spacing: 5)
    
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
        
        title.text = data.title
        
        if let subtitleText = data.subtitle, let rightImageName = data.rightImage {
            
            subtitle.text = subtitleText
            rightImage.image = UIImage(named: rightImageName)
            
            titleStackView.addArrangedSubview(title)
            titleStackView.addArrangedSubview(subtitle)
            
            finalStackView.addArrangedSubview(titleStackView)
            finalStackView.addArrangedSubview(rightImage)
            return
        }
        
        if let subtitleText = data.subtitle {
            
            subtitle.text = subtitleText
            
            titleStackView.addArrangedSubview(title)
            titleStackView.addArrangedSubview(subtitle)
            
            finalStackView.addArrangedSubview(titleStackView)
            return
        }
        
        if let rightImageName = data.rightImage {
            
            rightImage.image = UIImage(named: rightImageName)
            
            finalStackView.addArrangedSubview(title)
            finalStackView.addArrangedSubview(rightImage)
            return
        }
        
        finalStackView.addArrangedSubview(title)
    }
}

extension SideMenuCell {
    
    private func toFormUIElements() {
        
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        finalStackView.alignment = .center
        
        rightImage.widhtHeight(30, 30)
        
        addSubview(finalStackView)
        finalStackView.leftAnchor(leftAnchor, 10)
        finalStackView.rightAnchor(rightAnchor, -10)
        finalStackView.topAnchor(topAnchor, 10)
        finalStackView.bottomAnchor(bottomAnchor, -10)
    }
}
