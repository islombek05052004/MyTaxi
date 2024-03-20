//
//  PaymentTypeTableCell.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 09/02/24.
//

import UIKit
 
final class PaymentTypeVCTableCell: UITableViewCell {
    
    static let identifier = "PaymentTypeVCTableCell"
    
    private let leftImageView = UIImageView(image: nil,
                                            contentMode: .scaleAspectFit)
    
    private let title = UILabel(text: nil,
                                font: .systemFont(ofSize: 17, weight: .semibold))
    
    private let subtitle = UILabel(text: nil,
                                   textColor: .gray,
                                   font: .systemFont(ofSize: 14, weight: .regular))
    
    private let rightImageView = UIImageView(image: nil,
                                             contentMode: .scaleAspectFit)
    
    private let mainStackView = UIStackView(arrangedSubviews: [],
                                            axis: .horizontal,
                                            spacing: 10)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        toFormUIElements()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}

extension PaymentTypeVCTableCell {
    
    private func toFormUIElements() {
        
        let titleStackView = UIStackView(arrangedSubviews: [title, subtitle],
                                         axis: .vertical,
                                         spacing: 2)
        
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.widhtHeight(30, 30)
        rightImageView.clipsToBounds = true
        rightImageView.layer.cornerRadius = 15
        
        title.numberOfLines = 2
        
        addSubview(leftImageView)
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        leftImageView.widhtHeight(30, 30)
        leftImageView.leftAnchor(leftAnchor, 0)
        leftImageView.centerYAnchor(centerYAnchor, 0)
        
        mainStackView.alignment = .center
        mainStackView.distribution = .equalCentering
        addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leftAnchor(leftImageView.rightAnchor, 10)
        mainStackView.rightAnchor(rightAnchor, 0)
        mainStackView.topAnchor(topAnchor, 10)
        mainStackView.bottomAnchor(bottomAnchor, -10)
        
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(rightImageView)
    }
    
    func giveFormToCell(with paymentDataModel: PaymentTypeTableCellModel, indexPath: IndexPath) {
        
        title.text = nil
        subtitle.text = nil
        leftImageView.image = nil
        rightImageView.image = nil
        
        title.text = paymentDataModel.title
        subtitle.text = paymentDataModel.subTitle
        leftImageView.image = UIImage(named: paymentDataModel.leftImage)
        
        if let rightImage = paymentDataModel.rightImage {

            switch paymentDataModel.type {
                
            case .business:
                
                rightImageView.image = UIImage(named: rightImage)
                
            case .cashback:
                
                rightImageView.image = UIImage(named: rightImage)
                
            case .addPlasticCard:
                
                title.textColor = .systemBlue
                
            case .payment:
                
                rightImageView.backgroundColor = .systemGray5
                if paymentDataModel.selectedPayment {
                    rightImageView.image = UIImage(named: "checklist")
                    rightImageView.backgroundColor = .systemGray5
                }
            }
        }        
    }
}
