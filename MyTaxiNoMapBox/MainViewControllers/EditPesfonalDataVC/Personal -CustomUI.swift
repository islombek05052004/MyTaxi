//
//  PersonalData - CustomUI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 31/01/24.
//

import UIKit

class PersonalDataCustomView: UIView {
    
    init(label: UILabel, textField: UITextField) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        
        let stackView = UIStackView(
            arrangedSubviews: [label, textField],
            axis: .vertical,
            spacing: 10
        )
        let lineView = UIView()
        lineView.backgroundColor = .systemGray4
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        addSubview(lineView)

        stackView.leftAnchor(self.leftAnchor, 0)
        stackView.topAnchor(self.topAnchor, 0)
        stackView.rightAnchor(self.rightAnchor, 0)
        
        lineView.topAnchor(stackView.bottomAnchor, 0)
        lineView.leftAnchor(self.leftAnchor, 0)
        lineView.rightAnchor(self.rightAnchor, 0)
        lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        self.bottomAnchor(lineView.bottomAnchor, 2)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

