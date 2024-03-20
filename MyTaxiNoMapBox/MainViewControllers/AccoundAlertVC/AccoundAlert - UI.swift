//
//  AccoundAlert - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 30/01/24.
//

import UIKit

class AccoundAlertView: UIView {
    
    private let childView = CustomChildView()
    private let lineView = UIView()
    private let editLabel = UILabel(text: "Tahrirlash",
                                    font: .systemFont(ofSize: 25, weight: .semibold))
    
    let personalDataBtnView = AccoundAlertBtnView()
    let phoneBtnView = AccoundAlertBtnView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black.withAlphaComponent(0.4)
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccoundAlertView {
    
    private func toFormUIElements() {
        
        personalDataBtnView.toFormUIView(with: .personalData)
        phoneBtnView.toFormUIView(with: .phoneNumber)

        childView.backgroundColor = .white
        lineView.backgroundColor = .systemGray4
        
        let stackView = UIStackView(
            arrangedSubviews: [editLabel, lineView, personalDataBtnView, phoneBtnView],
            axis: .vertical,
            spacing: 10
        )
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        childView.addSubview(stackView)
        addSubview(childView)

        stackView.leftAnchor(childView.leftAnchor, 20)
        stackView.rightAnchor(childView.rightAnchor, -20)
        stackView.bottomAnchor(childView.safeAreaLayoutGuide.bottomAnchor, -20)
        stackView.topAnchor(childView.topAnchor, 20)
        
        childView.leftAnchor(leftAnchor, 0)
        childView.rightAnchor(rightAnchor, 0)
        childView.bottomAnchor(bottomAnchor, 0)
    }
}
