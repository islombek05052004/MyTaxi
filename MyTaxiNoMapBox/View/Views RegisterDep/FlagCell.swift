//
//  FlagCell.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 14/01/24.
//

import UIKit

class FlagCell: UITableViewCell {

    static let identifier = "cell"
    
    private let flagImage = UIImageView(image: nil, contentMode: .scaleToFill)
    private let nameFlag = UILabel(text: nil)
    private let countryCodeLabel = UILabel(text: nil, textColor: .gray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let mainStackView = UIStackView(
            arrangedSubviews: [flagImage, nameFlag, countryCodeLabel],
            axis: .horizontal,
            spacing: 20
        )
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        
        flagImage.widhtHeight(30, 30)
        flagImage.clipsToBounds = true
        flagImage.layer.cornerRadius = 5
        
        addSubview(mainStackView)
        
        mainStackView.leftAnchor(self.leftAnchor, 16)
        mainStackView.topAnchor(self.topAnchor, 16)
        mainStackView.bottomAnchor(self.bottomAnchor, -16)
        mainStackView.rightAnchor(self.rightAnchor, -16)
        
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setDataToCell(data: FlagData) {
        
        self.flagImage.image = UIImage(named: data.flagImageName)
        self.countryCodeLabel.text = data.codeCountry
        self.nameFlag.text = data.flagName
    }
}
