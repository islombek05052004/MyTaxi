//
//  Travels - TableViewCell.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

class TravelsTableViewCell: UITableViewCell {
    
    static let identifier = "TravelsTableViewCell"
    
    private let dateLabel = UILabel(text: "7 Fevral, Chorshanba",
                                    font: .systemFont(ofSize: 27, weight: .bold))
    
    private let fromLocationImage = UIImageView(
        image: UIImage(systemName: "smallcircle.filled.circle"),
        contentMode: .scaleAspectFit
    )
    
    private let toLocationImage = UIImageView(
        image: UIImage(systemName: "smallcircle.filled.circle"),
        contentMode: .scaleAspectFit
    )
    
    private let fromLocationLabel = UILabel(
        text: "Mirzo Ulug'bek tumani, Temur Malik 3a, Toshkent",
        font: .systemFont(ofSize: 18, weight: .semibold)
    )
    
    private let toLocationLabel = UILabel(text: "Shayhontoxur tumani, Yalankar 7/2, Toshkent",
                                          font: .systemFont(ofSize: 18, weight: .semibold))

    private let oclockLabel = UILabel(text: "14: 03",
                                      font: .systemFont(ofSize: 16, weight: .semibold))
    
    private let summLabel = UILabel(text: "31500 so'm",
                                    font: .systemFont(ofSize: 16, weight: .semibold))
    
    private let doteImage = UIImageView(image: UIImage(systemName: "circle.fill"),
                                        contentMode: .scaleAspectFit)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Set UIElements

extension TravelsTableViewCell {
    
    private func setUIElements() {
        
        let fromLocationStackView = UIStackView(
            arrangedSubviews: [fromLocationImage, fromLocationLabel],
            axis: .horizontal,
            spacing: 10
        )
        fromLocationStackView.alignment = .center
        
        let toLocationStackView = UIStackView(
            arrangedSubviews: [toLocationImage, toLocationLabel],
            axis: .horizontal,
            spacing: 10
        )
        toLocationStackView.alignment = .center
        
        let oclockSummStackView = UIStackView(
            arrangedSubviews: [oclockLabel, doteImage, summLabel],
            axis: .horizontal,
            spacing: 5,
            contentInsets: .init(top: 10, left: 10, bottom: 10, right: 10)
        )
        oclockSummStackView.alignment = .center
        oclockSummStackView.layer.cornerRadius = 10
        oclockSummStackView.backgroundColor = .systemGray5
        
        let informationStackView = UIStackView(
            arrangedSubviews: [fromLocationStackView, toLocationStackView, oclockSummStackView],
            axis: .vertical,
            spacing: 10,
            contentInsets: .init(top: 20, left: 15, bottom: 15, right: 15)
        )
        
        let mainStackView = UIStackView(
            arrangedSubviews: [dateLabel, informationStackView],
            axis: .vertical,
            spacing: 10
        )
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        informationStackView.backgroundColor = .white
        informationStackView.layer.cornerRadius = 20
        informationStackView.layer.borderColor = UIColor.systemGray5.cgColor
        informationStackView.layer.borderWidth = 1
        informationStackView.setShadow(0, 0, UIColor.gray.cgColor, 0.7, 5)
        
        fromLocationImage.translatesAutoresizingMaskIntoConstraints = false
        fromLocationImage.widhtHeight(20, 20)
        
        toLocationImage.translatesAutoresizingMaskIntoConstraints = false
        toLocationImage.widhtHeight(20, 20)
        toLocationImage.tintColor = .gray

        doteImage.translatesAutoresizingMaskIntoConstraints = false
        doteImage.widhtHeight(10, 10)
        doteImage.tintColor = .black
        
        dateLabel.numberOfLines = 0
        fromLocationLabel.numberOfLines = 0
        toLocationLabel.numberOfLines = 0
        
        addSubview(mainStackView)
        
        mainStackView.leftAnchor(leftAnchor, 20)
        mainStackView.rightAnchor(rightAnchor, -20)
        mainStackView.topAnchor(topAnchor, 10)
        mainStackView.bottomAnchor(bottomAnchor, -10)
    }
}

// MARK: Set data

extension TravelsTableViewCell {
    
    func setDataToCell() {
        
    }
}
