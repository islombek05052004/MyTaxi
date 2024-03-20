//
//  AddNewLocationVC - UI.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 16/02/24.
//

import UIKit
 

class AddNewLocationVCHomeView: UIView {
    
    private let addLocationLabel = UILabel(text: "Manzil qo'shish",
                                           font: .systemFont(ofSize: 22, weight: .semibold))
    private let lineView = UIView()
    
    let organizationBtn = CustomBtnWithLeftRightImage(leftImage: UIImage(named: "organization"),
                                                      title: "Tashkilot",
                                                      rightImage: nil)
    
    let buildingBtn = CustomBtnWithLeftRightImage(leftImage: UIImage(named: "building"),
                                                      title: "Manzil",
                                                      rightImage: nil)
    
    let roadBtn = CustomBtnWithLeftRightImage(leftImage: UIImage(named: "road"),
                                                      title: "Yo'l",
                                                      rightImage: nil)
    
    let barrierBtn = CustomBtnWithLeftRightImage(leftImage: UIImage(named: "barrier"),
                                                      title: "Yo'l to'sig'i",
                                                      rightImage: nil)
    
    let stationBtn = CustomBtnWithLeftRightImage(leftImage: UIImage(named: "station"),
                                                      title: "Bekat",
                                                      rightImage: nil)
    
    let walkerBtn = CustomBtnWithLeftRightImage(leftImage: UIImage(named: "walk"),
                                                      title: "Piyodalar o'tish joyi",
                                                      rightImage: nil)
    
    let moreBtn = CustomBtnWithLeftRightImage(leftImage: UIImage(named: "more"),
                                              title: "Boshqa",
                                              rightImage: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        backgroundColor = .white
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddNewLocationVCHomeView {
    
    private func toFormUIElements() {
        
        let mainStackView = UIStackView(
            arrangedSubviews: [addLocationLabel, lineView, organizationBtn, buildingBtn, roadBtn, barrierBtn, stationBtn, walkerBtn, moreBtn],
            axis: .vertical,
            spacing: 15
        )
        
        addSubview(mainStackView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.heightAnchor(height: 1)
        lineView.backgroundColor = .gray
        
        mainStackView.leftAnchor(leftAnchor, 20)
        mainStackView.rightAnchor(rightAnchor, -20)
        mainStackView.topAnchor(topAnchor, 20)
    }
}
