//
//  PerAdressCollViewCell.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 12/02/24.
//

import UIKit

final class PerAdressCollViewCell: UICollectionViewCell {
    
    static let identifier = "PerAdressCollViewCell"
    
    private let imageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private let titleLabel = UILabel(text: nil,
                                     textAlignment: .center,
                                     font: .systemFont(ofSize: 16, weight: .semibold))
    private let subtitleLabel = UILabel(text: nil,
                                        textColor: .gray,
                                        textAlignment: .center,
                                        font: .systemFont(ofSize: 13, weight: .regular))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius = 13
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PerAdressCollViewCell {
    
    private func toFormUIElements() {
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor(self.topAnchor, 20)
        imageView.centerXAnchor(self.centerXAnchor, 0)
        imageView.widhtHeight(60, 60)
        
        titleLabel.topAnchor(imageView.bottomAnchor, 10)
        titleLabel.leftAnchor(leftAnchor, 10)
        titleLabel.rightAnchor(rightAnchor, -10)
        titleLabel.numberOfLines = 1
        
        subtitleLabel.topAnchor(titleLabel.bottomAnchor, 5)
        subtitleLabel.leftAnchor(leftAnchor, 20)
        subtitleLabel.rightAnchor(rightAnchor, -20)
        subtitleLabel.numberOfLines = 2
    }
    
    func toFormCell(with data: PermanentAdressDataModel) {
        
        let config = UIImage.SymbolConfiguration(pointSize: 40)
        let image = UIImage(systemName: data.imageName, withConfiguration: config)
        self.imageView.image = image
        self.imageView.tintColor = data.backColorImage
        
        self.titleLabel.text = data.title
        self.titleLabel.textColor = data.titleColor

        self.backgroundColor = data.backColor
        self.subtitleLabel.text = data.subtitle
    }
}
