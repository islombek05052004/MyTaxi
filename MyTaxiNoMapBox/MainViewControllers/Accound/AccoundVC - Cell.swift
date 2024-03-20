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
        font: .systemFont(ofSize: 15, weight: .regular)
    )
    
    private let informationLabel = UILabel(
        text: nil,
        font: .systemFont(ofSize: 19, weight: .regular)
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setDataToCell(data: AccountVCData, indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            
            switch indexPath.row {
            case 0: informationLabel.text = data.number
            case 1: informationLabel.text = data.email
            case 2: informationLabel.text = data.birthday
            case 3: informationLabel.text = data.gender
            default: break
            }
        }
    }
}

extension AccoundTableViewCell {
    
    func formTitleCell(indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0: cellTitle.text = titleCellData.phoneNumber
        case 1: cellTitle.text = titleCellData.eMail
        case 2: cellTitle.text = titleCellData.birthday
        case 3: cellTitle.text = titleCellData.gender
        default: break
        }
    }
}


extension AccoundTableViewCell {
    
    private func toFormUIElements() {
        
        let stackView = UIStackView(
            arrangedSubviews: [cellTitle, informationLabel],
            axis: .vertical,
            spacing: 10
        )
        stackView.distribution = .equalSpacing
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cellTitle.heightAnchor.constraint(equalToConstant: 15).isActive = true
        informationLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        stackView.leftAnchor(leftAnchor, 20)
        stackView.topAnchor(topAnchor, 10)
        stackView.rightAnchor(rightAnchor, -20)
        stackView.bottomAnchor(bottomAnchor, -10)
    }
}


