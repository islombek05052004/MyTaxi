//
//  CustomerServiceVCHomeView.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 14/02/24.
//

import UIKit

class CustomerServiceVCHomeView: UIView {
    
    private let writeSMSLabel = UILabel(text: "Xabar yuborish",
                                font: .systemFont(ofSize: 18, weight: .semibold))
    let textView: UITextView = {
       
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = .systemFont(ofSize: 22, weight: .semibold)
        textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 2
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 10
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomerServiceVCHomeView {
    
    private func toFormUIElements() {
        
        let mainStackView = UIStackView(
            arrangedSubviews: [writeSMSLabel, textView],
            axis: .vertical,
            spacing: 20
        )
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainStackView)
        
        mainStackView.leftAnchor(leftAnchor, 20)
        mainStackView.rightAnchor(rightAnchor, -20)
        mainStackView.topAnchor(safeAreaLayoutGuide.topAnchor, 20)
    }
}
