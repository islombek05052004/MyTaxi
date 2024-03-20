//
//  HelpVC - UI.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 11/02/24.
//

import UIKit

final class HelpVCHomeView: UIView {
    
    let supportBtn = CustomBtnWithConfiguration(
        backColor: .white,
        iconImage: UIImage(named: "chat"),
        title: "Qo'llab quvvatlash sizmatiga yozing",
        config: .tinted(),
        cornerStyle: .small,
        imagePlacement: .top
    )
    
    let callBtn = CustomBtnWithConfiguration(
        backColor: .white,
        iconImage: UIImage(named: "call"),
        title: "Qo'ng'iroq qilish",
        config: .tinted(),
        cornerStyle: .small,
        imagePlacement: .top
    )
    
    let telegramBtn = CustomBtnWithConfiguration(
        backColor: .white,
        iconImage: UIImage(named: "telegram"),
        title: "Telegram",
        config: .tinted(),
        cornerStyle: .small,
        imagePlacement: .top
    )
    
    let errorBtn = CustomBtnWithConfiguration(
        backColor: .white,
        iconImage: UIImage(named: "warning"),
        title: "Xatolik haqida xabar berish",
        config: .tinted(),
        cornerStyle: .small,
        imagePlacement: .top
    )
    
    let addLocationBtn = CustomBtnWithConfiguration(
        backColor: .white,
        iconImage: UIImage(named: "add"),
        title: "joylashuv yoki manzil qo'shish",
        config: .tinted(),
        cornerStyle: .small,
        imagePlacement: .top
    )
    
    let tariffBtn = CustomBtnWithConfiguration(
        backColor: .white,
        iconImage: UIImage(named: "menu"),
        title: "Tariflar",
        config: .tinted(),
        cornerStyle: .small,
        imagePlacement: .top
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension HelpVCHomeView {
    
    private func toFormUIElements() {
        
        let firstStackView = UIStackView(
            arrangedSubviews: [supportBtn, callBtn],
            axis: .horizontal,
            spacing: 20
        )
        
        let secondStackView = UIStackView(
            arrangedSubviews: [telegramBtn, errorBtn],
            axis: .horizontal,
            spacing: 20
        )
        
        let thirdStackView = UIStackView(
            arrangedSubviews: [addLocationBtn, tariffBtn],
            axis: .horizontal,
            spacing: 20
        )
        
        let mainStackView = UIStackView(
            arrangedSubviews: [firstStackView, secondStackView, thirdStackView],
            axis: .vertical,
            spacing: 20
        )
        
        
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        firstStackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        thirdStackView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainStackView)
        mainStackView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 20)
        mainStackView.leftAnchor(leftAnchor, 20)
        mainStackView.rightAnchor(rightAnchor, -20)
    }
}
