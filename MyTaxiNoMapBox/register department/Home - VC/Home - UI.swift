//
//  Home - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 04/02/24.
//

import UIKit


final class HomeView: UIView {
    
    let englishBtn: UIButton = .languageBtn(type: .eng)
    let uzbekBtn: UIButton = .languageBtn(type: .uzb)
    let russianBtn: UIButton = .languageBtn(type: .rus)
    let nextBtn = UIButton(title: "Keyingisi",  backColor: .rgb(r: 247, g: 228, b: 76))
    
    lazy var uzbButtonView = SelectedRegisterView(
        image: UIImage(named: "uzb"), text: "O'zbekcha", button: uzbekBtn
    )
    lazy var russianButtonView = SelectedRegisterView(
        image: UIImage(named: "rus"), text: "Русский", button: russianBtn
    )
    lazy var englishButtonView = SelectedRegisterView(
        image: UIImage(named: "eng"), text: "English", button: englishBtn
    )
    var selected = false
    private let childView = CustomChildView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackImage()
        setBottomChildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension HomeView {
    
    private func setBackImage() {
        
        let backImage = UIImageView (
            image: UIImage(named: "registerBackImage"), contentMode: .scaleAspectFill
        )
        let gradient = CAGradientLayer()

        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.frame = CGRect(x: 0,
                                y: 0,
                                width: Int(Paddings.deviceBounds.width),
                                height: Int(Paddings.deviceBounds.height - 300))


        self.addSubview(backImage)
        backImage.translatesAutoresizingMaskIntoConstraints = false
        
        backImage.leftAnchor(self.leftAnchor, 0)
        backImage.rightAnchor(rightAnchor, 0)
        backImage.bottomAnchor(bottomAnchor, 0)
        backImage.topAnchor(topAnchor, 0)
        
        backImage.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setBottomChildView() {
        
        childView.backgroundColor = .rgb(r: 248, g: 248, b: 248)
        
        let changeLanguageLabel = UILabel(
            text: "Ilova tilini tanlang", font: .systemFont(ofSize: 22, weight: .semibold), backColor: .clear
        )
        
        let buttonStackView = UIStackView(
            arrangedSubviews: [changeLanguageLabel, uzbButtonView, russianButtonView, englishButtonView],
            axis: .vertical,
            spacing: 10
        )
        
        let finalStackView = UIStackView(
            arrangedSubviews: [buttonStackView, nextBtn],
            axis: .vertical,
            spacing: 40
        )
        
        self.addSubview(childView)
        childView.addSubview(finalStackView)

        changeLanguageLabel.translatesAutoresizingMaskIntoConstraints = false
        finalStackView.translatesAutoresizingMaskIntoConstraints = false
        childView.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        changeLanguageLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        childView.leftAnchor(self.leftAnchor, 0)
        childView.rightAnchor(self.rightAnchor, 0)
        childView.bottomAnchor(self.bottomAnchor, 0)

        finalStackView.leftAnchor(childView.leftAnchor, 20)
        finalStackView.rightAnchor(childView.rightAnchor, -20)
        finalStackView.topAnchor(childView.topAnchor, 40)
        finalStackView.bottomAnchor(childView.bottomAnchor, -40)
    }
}
