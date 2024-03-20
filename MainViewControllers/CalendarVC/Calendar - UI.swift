//
//  Calendar - UI.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 22/02/24.
//

import UIKit

final class CalendarVCHomeView: UIView {
    
    private let birthdayLabel = UILabel(text: "Tug'ilgan sana",
                                        font: .systemFont(ofSize: 26, weight: .semibold))
    
    private let childView = CustomChildView()
    
    let dataPicker = UIDatePicker()
    
    let saveBtn = UIButton(title: "Saqlash",
                           backColor: .systemYellow,
                           font: .systemFont(ofSize: 20, weight: .semibold))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CalendarVCHomeView {
    
    private func toFormUIElements() {
        
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        dataPicker.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
                
        let mainStackView = UIStackView(
            arrangedSubviews: [birthdayLabel, dataPicker, saveBtn],
            axis: .vertical,
            spacing: 10,
            contentInsets: .init(top: 20, left: 20, bottom: 20, right: 20)
        )
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        dataPicker.datePickerMode = .date
        dataPicker.preferredDatePickerStyle = .wheels
        dataPicker.heightAnchor(height: 200)
        
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.backgroundColor = .white
        
        addSubview(childView)
        childView.addSubview(mainStackView)
        
        childView.leftAnchor(leftAnchor, 0)
        childView.rightAnchor(rightAnchor, 0)
//        childView.topAnchor(topAnchor, 0)
        childView.bottomAnchor(bottomAnchor, 0)
        
        saveBtn.heightAnchor(height: 60)
        
        mainStackView.leftAnchor(childView.leftAnchor, 0)
        mainStackView.topAnchor(childView.topAnchor, 0)
        mainStackView.rightAnchor(childView.rightAnchor, 0)
        mainStackView.bottomAnchor(childView.bottomAnchor, 0)
    }
}
