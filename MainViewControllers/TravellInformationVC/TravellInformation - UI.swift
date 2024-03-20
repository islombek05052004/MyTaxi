//
//  TravellInformation - UI.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 23/02/24.
//

import UIKit

private let titleFonts: UIFont? = .systemFont(ofSize: 18, weight: .semibold)
private let descFonts: UIFont? = .systemFont(ofSize: 18, weight: .regular)

final class TravellInformationVCHomeView: UIView {
    
    private var finalMainStackView = UIStackView(
        arrangedSubviews: [],
        axis: .vertical,
        spacing: 20,
        contentInsets: .init(top: 5, left: 0, bottom: 20, right: 0)
    )
    private let mainScrollView = UIScrollView()

    // MARK: UI elements for car information
    
    private let codeCity = UILabel(text: "01", font: titleFonts)
    private let firstAlphabetLabel = UILabel(text: "S", font: titleFonts)
    private let numCar = UILabel(text: "482", font: titleFonts)
    private let secondAlphabet = UILabel(text: "CB", font: titleFonts)
    private let codeCityVerticalLineView = UIView()
    private let carName = UILabel(
        text: "To'q kulrang Chevrolet Lacetti",
        textColor: .gray,
        font: .systemFont(ofSize: 17, weight: .regular)
    )
    private let carImage = UIImageView(image: UIImage(named: "premium"),
                                       contentMode: .scaleAspectFit)
    
    let helpBtn = CustomBtnWithConfiguration(
        backColor: .systemYellow,
        iconImage: UIImage(systemName: "questionmark.circle.fill")?.withTintColor(.orange),
        targetSizeOffIcon: .init(width: 35, height: 35),
        title: "Yordam",
        config: .tinted(),
        cornerStyle: .medium,
        imagePlacement: .top,
        baseForegroundColor: .orange
    )
    
    //MARK: UI elements for travell information
    
    private let tariffLabel = UILabel(text: "Tarif", font: titleFonts)
    private let tariffType = UILabel(text: "Ekonom", font: descFonts)
    private let paymentTypeLabel = UILabel(text: "To'lov turi", font: titleFonts)
    private let paymentType = UILabel(text: "Naxt pul", font: descFonts)
    private let orderLabel = UILabel(text: "Buyurtma No", font: titleFonts)
    private let orderNum = UILabel(text: "36712833871", font: descFonts)
    private let timeTravellLabel = UILabel(text: "Safar kuni va vaqti", font: titleFonts)
    private let timeTravell = UILabel(text: "7 Fevral, 14:03", font: descFonts)
    private let continuityTimeLabel = UILabel(text: "Safar davomiyligi", font: titleFonts)
    private let continuityTime = UILabel(text: "32 min", font: descFonts)
    
    //MARK: UI elements for location information
    
    private let fromLocationImageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private let toLocationImageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private let fromLocationLabel = UILabel(
        text: "Mirzo Ulug'bek tumani, Temur Malik 3a, Toshkent",
        font: titleFonts
    )
    private let toLocationLabel = UILabel(
        text: "Shayhontoxur tumani, Yalankar 7/2, Tashkent",
        font: titleFonts
    )
    
    //MARK: UI elements for driver information
    
    private let driverImageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private let driverNameLabel = UILabel(text: "Sherzod Tolipov")
    private let ratingLabel = UILabel(
        text: "Reyting",
        textColor: .gray,
        font: .systemFont(ofSize: 17, weight: .regular)
    )
    private let rating = UILabel(
        text: "5.0",
        font: .systemFont(ofSize: 17, weight: .semibold)
    )
    private let travellsCountLabel = UILabel(
        text: "Safarlar",
        textColor: .gray,
        font: .systemFont(ofSize: 17, weight: .regular)
    )
    private let travellsCount = UILabel(
        text: "21",
        font: .systemFont(ofSize: 17, weight: .semibold)
    )
    
    //MARK: UI elements for summ information
    
    private let paymentTravellLabel = UILabel(
        text: "Safar to'lovi",
        font: .systemFont(ofSize: 19, weight: .semibold)
    )
    private let paymentSumm = UILabel(text: "34 700 so'm")
    private let totalLabel = UILabel(
        text: "Jami",
        font: .systemFont(ofSize: 22, weight: .semibold)
    )
    private let totalSumm = UILabel(
        text: "31 500 so'm",
        font: .systemFont(ofSize: 22, weight: .semibold)
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray6
        
        addSubview(mainScrollView)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.leftAnchor(leftAnchor, 0)
        mainScrollView.topAnchor(topAnchor, 0)
        mainScrollView.widthAnchor(width: Paddings.deviceBounds.width)
        mainScrollView.bottomAnchor(bottomAnchor, 0)
        
        mainScrollView.addSubview(finalMainStackView)
        finalMainStackView.translatesAutoresizingMaskIntoConstraints = false
        finalMainStackView.leftAnchor(mainScrollView.leftAnchor, 20)
        finalMainStackView.widthAnchor(width: Paddings.deviceBounds.width - 40)
        finalMainStackView.topAnchor(mainScrollView.topAnchor, 20)
        finalMainStackView.bottomAnchor(mainScrollView.bottomAnchor, -20)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TravellInformationVCHomeView {
    
    private func toFormUIElements() {
        toFormCarInformationStackView()
        toFormTravellInformationStackView()
        toFormLocationInformationStackView()
        toFormDriverInformationStackView()
        toFormSummInformationStackView()
    }
    
    private func toFormCarInformationStackView() {
        
        let codeCityStackView = UIStackView(
            arrangedSubviews: [codeCity, codeCityVerticalLineView, firstAlphabetLabel, numCar, secondAlphabet],
            axis: .horizontal,
            spacing: 10,
            contentInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        )
        
        let carInformationStackView = UIStackView(
            arrangedSubviews: [codeCityStackView, carName],
            axis: .vertical,
            spacing: 10
        )
        
        let carInformationWithImageStackView = UIStackView(
            arrangedSubviews: [carInformationStackView, carImage],
            axis: .horizontal,
            spacing: 10
        )
        
        let mainCarInformationStackView = UIStackView(
            arrangedSubviews: [carInformationWithImageStackView, helpBtn],
            axis: .vertical,
            spacing: 10,
            contentInsets: UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        )
        
        carInformationWithImageStackView.alignment = .center
        carInformationStackView.alignment = .leading

        mainCarInformationStackView.backgroundColor = .white
        mainCarInformationStackView.clipsToBounds = true
        mainCarInformationStackView.layer.cornerRadius = 20
        
        codeCityStackView.layer.borderColor = UIColor.gray.cgColor
        codeCityStackView.layer.borderWidth = 1
        codeCityStackView.layer.cornerRadius = 8
        
        codeCityVerticalLineView.translatesAutoresizingMaskIntoConstraints = false
        codeCityVerticalLineView.widthAnchor(width: 2)
        codeCityVerticalLineView.backgroundColor = .gray
        
        carImage.translatesAutoresizingMaskIntoConstraints = false
        carImage.widhtHeight(50, 35)
        
        finalMainStackView.addArrangedSubview(mainCarInformationStackView)
        
        helpBtn.translatesAutoresizingMaskIntoConstraints = false
        helpBtn.heightAnchor(height: 75)
    }
    
    private func toFormTravellInformationStackView() {
        
        let firstStackView = UIStackView(
            arrangedSubviews: [tariffLabel, tariffType],
            axis: .horizontal,
            spacing: 10
        )
                
        let needLabels: [(UIView, UIView)] = [
            (paymentTypeLabel, paymentType),
            (orderLabel, orderNum),
            (timeTravellLabel, timeTravell),
            (continuityTimeLabel, continuityTime)
        ]
        
        let mainTravellInformationStackView = UIStackView(
            arrangedSubviews: [firstStackView],
            axis: .vertical,
            spacing: 10,
            contentInsets: UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        )
        
        for item in needLabels {
            
            let stackView = UIStackView(
                arrangedSubviews: [item.0, item.1],
                axis: .horizontal,
                spacing: 10
            )
            
            stackView.distribution = .equalCentering
            
            let lineView = UIView()
            lineView.backgroundColor = .gray
            lineView.translatesAutoresizingMaskIntoConstraints = false
            lineView.heightAnchor(height: 1)
            
            mainTravellInformationStackView.addArrangedSubview(lineView)
            mainTravellInformationStackView.addArrangedSubview(stackView)

        }
        
        finalMainStackView.addArrangedSubview(mainTravellInformationStackView)
        mainTravellInformationStackView.layer.cornerRadius = 20
        mainTravellInformationStackView.backgroundColor = .white
    }
    
    private func toFormLocationInformationStackView() {
        
        let fromLocationStackView = UIStackView(
            arrangedSubviews: [fromLocationImageView, fromLocationLabel],
            axis: .horizontal,
            spacing: 10
        )
        fromLocationStackView.alignment = .center
        
        let toLocationStackView = UIStackView(
            arrangedSubviews: [toLocationImageView, toLocationLabel],
            axis: .horizontal,
            spacing: 10
        )
        toLocationStackView.alignment = .center
        
        let lineView = UIView()
        
        let mainLocationStackView = UIStackView(
            arrangedSubviews: [fromLocationStackView, lineView, toLocationStackView],
            axis: .vertical,
            spacing: 10,
            contentInsets: .init(top: 15, left: 20, bottom: 15, right: 20)
        )
        
        let fromLocationImage = UIImage(systemName: "record.circle")
        
        let toLocationImage = UIImage(systemName: "record.circle")
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .gray
        lineView.heightAnchor(height: 1)
        
        fromLocationImageView.translatesAutoresizingMaskIntoConstraints = false
        fromLocationImageView.image = fromLocationImage
        fromLocationImageView.widhtHeight(20, 20)
        fromLocationImageView.tintColor = .blue
        
        toLocationImageView.translatesAutoresizingMaskIntoConstraints = false
        toLocationImageView.image = toLocationImage
        toLocationImageView.widhtHeight(20, 20)
        toLocationImageView.tintColor = .gray

        toLocationLabel.numberOfLines = 0
        fromLocationLabel.numberOfLines = 0
        
        mainLocationStackView.layer.cornerRadius = 20
        mainLocationStackView.backgroundColor = .white
        
        finalMainStackView.addArrangedSubview(mainLocationStackView)
    }
    
    private func toFormDriverInformationStackView() {
        
        let ratingStackView = UIStackView(
            arrangedSubviews: [ratingLabel, rating],
            axis: .horizontal,
            spacing: 5
        )
        
        let travellsStackView = UIStackView(
            arrangedSubviews: [travellsCountLabel, travellsCount],
            axis: .horizontal,
            spacing: 5
        )
        
        let ratingTravelsStackView = UIStackView(
            arrangedSubviews: [ratingStackView, travellsStackView],
            axis: .horizontal,
            spacing: 20
        )
        

        let informationStackView = UIStackView(
            arrangedSubviews: [driverNameLabel, ratingTravelsStackView],
            axis: .vertical,
            spacing: 10
        )
        
        let mainDriverInformationStackView = UIStackView(
            arrangedSubviews: [driverImageView, informationStackView],
            axis: .horizontal,
            spacing: 15,
            contentInsets: .init(top: 15, left: 20, bottom: 15, right: 20)
        )
        
        informationStackView.alignment = .leading
        
        mainDriverInformationStackView.backgroundColor = .white
        mainDriverInformationStackView.layer.cornerRadius = 20
        mainDriverInformationStackView.alignment = .center
                
        driverImageView.image = UIImage(systemName: "person.crop.circle.fill")
        driverImageView.tintColor = .gray
        driverImageView.translatesAutoresizingMaskIntoConstraints = false
        driverImageView.widhtHeight(60, 60)
        
        finalMainStackView.addArrangedSubview(mainDriverInformationStackView)
    }
    
    private func toFormSummInformationStackView() {
        
        let paymentStackView = UIStackView(
            arrangedSubviews: [paymentTravellLabel, paymentSumm],
            axis: .horizontal,
            spacing: 20
        )
        
        let totalSummStackView = UIStackView(
            arrangedSubviews: [totalLabel, totalSumm],
            axis: .horizontal,
            spacing: 20
        )
        
        let lineView = UIView()
        
        let mainSummStackView = UIStackView(
            arrangedSubviews: [paymentStackView, lineView, totalSummStackView],
            axis: .vertical,
            spacing: 10,
            contentInsets: .init(top: 15, left: 20, bottom: 15, right: 20)
        )
        
        totalSummStackView.distribution = .equalCentering
        
        mainSummStackView.backgroundColor = .white
        mainSummStackView.layer.cornerRadius = 20
        
        lineView.backgroundColor = .gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor(height: 1)
        
        finalMainStackView.addArrangedSubview(mainSummStackView)
    }
}
