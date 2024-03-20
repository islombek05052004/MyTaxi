//
//  Accound - TableViewCell.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit

class AccoundTableViewCell: UITableViewCell {
    
    static let identifier = "AccoundTableViewCell"
    private let titleCellData = AccoundVCTitleData()
    
    private let cellTitle = UILabel(
        text: "Telefon nomer",
        textColor: .gray,
        font: .systemFont(ofSize: 13, weight: .semibold)
    )
    
    private let informationLabel = UILabel(
        text: nil,
        font: .systemFont(ofSize: 14, weight: .regular)
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccoundTableViewCell {
    
    func formTitleCell(indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0: cellTitle.text = titleCellData.phoneNumber
        case 1: cellTitle.text = titleCellData.birthday
        case 2: cellTitle.text = titleCellData.gender
        default: break
        }
    }
    
    func setDataToCell(data: AccountVCData, indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            
            switch indexPath.row {
            case 0: informationLabel.text = data.number
            case 1: informationLabel.text = data.birthday
            case 2: informationLabel.text = data.gender
            default: break
            }
        }
    }
}


extension AccoundTableViewCell {
    
    private func toFormUIElements() {
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.heightAnchor.constraint(equalToConstant: 15).isActive = true

        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        let stackView = UIStackView(
            arrangedSubviews: [cellTitle, informationLabel],
            axis: .vertical,
            spacing: 5
        )
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        
        stackView.leftAnchor(leftAnchor, 10)
        stackView.topAnchor(topAnchor, 10)
        stackView.rightAnchor(rightAnchor, -10)
        stackView.bottomAnchor(bottomAnchor, -10)
    }
}


