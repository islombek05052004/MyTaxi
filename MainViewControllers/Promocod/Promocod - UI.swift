//
//  Promocod - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

final class PromocodVCView: UIView {
    
    let smileImageView = UIImageView(image: UIImage(named: "smileEmoji"),
                                     contentMode: .scaleAspectFit)
    
    let descriptionLabel = UILabel(text: "Agar sizda promokod bo'lsa, uni tezroq qo'shing",
                                   textAlignment: .center,
                                   font: .systemFont(ofSize: 16, weight: .semibold))
    
    let addPromocodBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PromocodVCView {
    
    private func toFormUIElements() {
        
        var config = UIButton.Configuration.tinted()
        config.image = UIImage(systemName: "plus")
        config.title = "Promokod qo'shish"
        config.imagePadding = 10
        config.cornerStyle = .medium
        config.baseBackgroundColor = .systemBlue
        addPromocodBtn.configuration = config
        addPromocodBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        
        smileImageView.image?.withRenderingMode(.alwaysOriginal)
        
        descriptionLabel.numberOfLines = 0
        
        addSubview(smileImageView)
        addSubview(addPromocodBtn)
        addSubview(descriptionLabel)
        
        addPromocodBtn.translatesAutoresizingMaskIntoConstraints = false
        smileImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        smileImageView.centerXAnchor(centerXAnchor, 0)
        smileImageView.centerYAnchor(centerYAnchor, -60)
        smileImageView.widhtHeight(200, 200)
        
        descriptionLabel.topAnchor(smileImageView.bottomAnchor, 10)
        descriptionLabel.centerXAnchor(centerXAnchor, 0)
        descriptionLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
        
        addPromocodBtn.topAnchor(descriptionLabel.bottomAnchor, 20)
        addPromocodBtn.leftAnchor(leftAnchor, 20)
        addPromocodBtn.rightAnchor(rightAnchor, -20)
        addPromocodBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
