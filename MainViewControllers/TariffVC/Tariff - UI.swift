//
//  Tariff - UI.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 19/02/24.
//

import UIKit

enum CarTariffType: Int, CaseIterable {
    
    case econom = 0
    case comfort = 1
    case premium = 2
    case cottage = 3
    case smallBody = 4
    case mediumBody = 5
    case largeBody = 6
    case delivery = 7
}

private let fontPrices: UIFont? = .systemFont(ofSize: 17, weight: .semibold)
private let fontTitle: UIFont? = .systemFont(ofSize: 18, weight: .regular)

final class TariffVCHomeView: UIView {
    
    private let scrollView = UIScrollView()
    
    private let informationScrollView = UIScrollView()

    private let tariffTypeStackView = UIStackView(arrangedSubviews: [],
                                                  axis: .horizontal,
                                                  spacing: 20)
    
    private let lineViewoffTariffStackView = UIView()

    private let tariffTitleArr = ["Ekonom", "Kamfort", "Premium", "Dacha",
                                  "Kichik kuzuvli", "Katta kuzuvli"]
    
    let carImageView = UIImageView(image: nil,
                                   contentMode: .scaleAspectFill)
    
    let priceLabel = UILabel(text: "Enonom 5000 so'mdan",
                             font: .systemFont(ofSize: 26, weight: .semibold))
    
    let minPriceTitleLabel = UILabel(text: "Minimal buyurtma narxi",
                                     font: fontTitle)
    
    let minPriceLabel = UILabel(text: "5000 so'mdan",
                                font: fontPrices)

    let includedLabel = UILabel(text: "3 km yoki 1 min hisobida",
                                textColor: .gray,
                                font: .systemFont(ofSize: 15, weight: .regular))
    
    let priceKmTitleLabel = UILabel(text: "1 km narxi",
                                    font: fontTitle)
    
    let priceKmLabel = UILabel(text: "1250 so'm",
                               font: fontPrices)
    
    let priceTimeTitleLabel = UILabel(text: "1 min narxi",
                                      font: fontTitle)

    let priceTimeLabel = UILabel(text: "200 so'm",
                                 font: fontPrices)

    let paidWaitingTitleLabel = UILabel(text: "Pulli kutib turish",
                                        font: fontTitle)
    
    let paidWaitingLabel = UILabel(text: "550 so'm",
                                   font: fontPrices)
    
    let freeWaitingTitleLabel = UILabel(text: "Kutib turish",
                                        font: fontTitle)
    
    let freeWaitingLabel = UILabel(text: "3 min",
                                   font: fontPrices)

    let priceForKmCityTitleLabel = UILabel(text: "1 km shahar ichida",
                                           font: fontTitle)
    
    let priceForKmCityLabel = UILabel(text: "2600 so'm/km",
                                      font: fontPrices)
    
    let descriptionTitleLabel = UILabel(text: "Malumot", font: fontTitle)
    
    let descriptionLabel = UILabel(text: "", font: fontPrices)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        toFormUIElements()
        setCurrentInformation(tariffType: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TariffVCHomeView {
    
    private func toFormUIElements() {
        
        let minPriceTitleLabelStackView = UIStackView(
            arrangedSubviews: [minPriceTitleLabel, includedLabel],
            axis: .vertical,
            spacing: 2
        )
        
        let minPriceStackView = UIStackView(
            arrangedSubviews: [minPriceTitleLabelStackView, minPriceLabel],
            axis: .horizontal,
            spacing: 10
        )
        
        minPriceStackView.alignment = .center
        minPriceStackView.distribution = .fillProportionally
        
        let mainStackView = UIStackView(
            arrangedSubviews: [minPriceStackView],
            axis: .vertical,
            spacing: 20
        )
        
        let descriptionStackView = UIStackView(
            arrangedSubviews: [descriptionTitleLabel, descriptionLabel],
            axis: .vertical,
            spacing: 4
        )
        
        let remainingInforArr: [(UIView, UIView)] = [
            (priceKmTitleLabel, priceKmLabel),
            (priceTimeTitleLabel, priceTimeLabel),
            (paidWaitingTitleLabel, paidWaitingLabel),
            (freeWaitingTitleLabel, freeWaitingLabel),
            (priceForKmCityTitleLabel, priceForKmCityLabel)
        ]
        
        for item in remainingInforArr {
            
            let stackView = UIStackView(
                arrangedSubviews: [item.0, item.1],
                axis: .horizontal,
                spacing: 10
            )
            
            let lineView = UIView()
            lineView.backgroundColor = .gray
            lineView.translatesAutoresizingMaskIntoConstraints = false
            lineView.heightAnchor(height: 1)
            
            let finallyStackView = UIStackView(
                arrangedSubviews: [lineView, stackView],
                axis: .vertical,
                spacing: 20
            )
            
            mainStackView.addArrangedSubview(finallyStackView)
        }
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        
        addSubview(scrollView)
        scrollView.addSubview(tariffTypeStackView)
        addSubview(informationScrollView)
        addSubview(lineViewoffTariffStackView)
                
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 0)
        scrollView.leftAnchor(leftAnchor, 0)
        scrollView.rightAnchor(rightAnchor, 0)
        scrollView.heightAnchor(height: 50)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        
        tariffTypeStackView.translatesAutoresizingMaskIntoConstraints = false
        tariffTypeStackView.leftAnchor(scrollView.leftAnchor, 0)
        tariffTypeStackView.topAnchor(scrollView.topAnchor, 0)
        tariffTypeStackView.rightAnchor(scrollView.rightAnchor, 0)
        tariffTypeStackView.bottomAnchor(scrollView.bottomAnchor, 0)
        tariffTypeStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tariffTypeStackView.isLayoutMarginsRelativeArrangement = true
        
        lineViewoffTariffStackView.translatesAutoresizingMaskIntoConstraints = false
        lineViewoffTariffStackView.widhtHeight(Paddings.deviceBounds.width, 1)
        lineViewoffTariffStackView.backgroundColor = .gray
        lineViewoffTariffStackView.topAnchor(scrollView.bottomAnchor, 0)
        lineViewoffTariffStackView.leftAnchor(leftAnchor, 0)
        
        informationScrollView.addSubview(carImageView)
        informationScrollView.addSubview(priceLabel)
        informationScrollView.addSubview(mainStackView)
        informationScrollView.addSubview(descriptionStackView)
        
        informationScrollView.translatesAutoresizingMaskIntoConstraints = false
        informationScrollView.leftAnchor(self.leftAnchor, 0)
        informationScrollView.widthAnchor(width: Paddings.deviceBounds.width)
        informationScrollView.topAnchor(lineViewoffTariffStackView.bottomAnchor, 0)
        informationScrollView.bottomAnchor(self.bottomAnchor, 0)
        
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        carImageView.topAnchor(informationScrollView.topAnchor, 10)
        carImageView.centerXAnchor(informationScrollView.centerXAnchor, 0)
        carImageView.widhtHeight(250, 250)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.leftAnchor(informationScrollView.leftAnchor, 20)
        priceLabel.widthAnchor(width: Paddings.deviceBounds.width - 40)
        priceLabel.topAnchor(carImageView.bottomAnchor, 20)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leftAnchor(informationScrollView.leftAnchor, 20)
        mainStackView.widthAnchor(width: Paddings.deviceBounds.width - 40)
        mainStackView.topAnchor(priceLabel.bottomAnchor, 20)
        mainStackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.backgroundColor = .white
        mainStackView.layer.cornerRadius = 20
        mainStackView.clipsToBounds = true
        
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.backgroundColor = .white
        descriptionStackView.layer.cornerRadius = 20
        descriptionStackView.clipsToBounds = true
        descriptionStackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        descriptionStackView.isLayoutMarginsRelativeArrangement = true
        
        descriptionStackView.leftAnchor(informationScrollView.leftAnchor, 20)
        descriptionStackView.widthAnchor(width: Paddings.deviceBounds.width - 40)
        descriptionStackView.topAnchor(mainStackView.bottomAnchor, 20)
        descriptionStackView.bottomAnchor(informationScrollView.bottomAnchor, -20)
        
        for (index, title) in tariffTitleArr.enumerated() {
            
            let btn = UIButton(type: .system)
            btn.backgroundColor = .clear
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.gray, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
            btn.tag = index
            btn.addTarget(self,
                          action: #selector(typeSelected(currentbtn: )),
                          for: .touchUpInside)
            tariffTypeStackView.addArrangedSubview(btn)
        }
    }
    
    @objc func typeSelected(currentbtn: UIButton) {
        setCurrentInformation(tariffType: currentbtn.tag)
    }
    
    private func setCurrentInformation(tariffType: Int) {
        
        TariffLocalDataManager.shared.getTariffInformation(tariffType: tariffType) { TariffInformation in
            
            for tag in 0..<self.tariffTitleArr.count {
                
                guard let btn = self.viewWithTag(tag) as? UIButton else { continue }
                if tag == tariffType {
                    btn.setTitleColor(.black, for: .normal)
                    btn.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
                } else {
                    btn.setTitleColor(.gray, for: .normal)
                    btn.titleLabel?.font = .systemFont(ofSize: 19, weight: .regular)
                }
            }
            
            self.descriptionLabel.text = TariffInformation.cars
            self.carImageView.image = UIImage(named: TariffInformation.imageName)
            self.priceLabel.text = TariffInformation.price
            self.minPriceLabel.text = TariffInformation.minPrice
            self.priceKmLabel.text = TariffInformation.priceKm
            self.priceTimeLabel.text = TariffInformation.priceTime
            self.paidWaitingLabel.text = TariffInformation.paidWaiting
            self.freeWaitingLabel.text = TariffInformation.freeWaiting
            self.priceForKmCityLabel.text = TariffInformation.priceKmForCity
        }
    }
}
