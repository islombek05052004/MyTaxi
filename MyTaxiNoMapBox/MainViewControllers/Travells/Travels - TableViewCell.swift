//
//  Travels - TableViewCell.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

class TableCell: UITableViewCell {
    
    static let identifier = "identifier"
    
    private let imageWeather: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "applelogo")
        return imageView
    }()
    
    private let temperatureLabel: UILabel =  {
       
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel =  {
       
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUIElements()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Set UIElements

extension TableCell {
    
    private func setUIElements() {
        
        contentView.backgroundColor = .white
        contentView.addSubview(imageWeather)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    private func setConstraints() {
        
        imageWeather.leftAnchor(contentView.leftAnchor, 20)
        imageWeather.topAnchor(contentView.topAnchor, 20)
        imageWeather.bottomAnchor(contentView.bottomAnchor, -20)
        imageWeather.widhtHeight(50, 50)
        
        stackView.topAnchor(contentView.topAnchor, 10)
        stackView.leftAnchor(imageWeather.rightAnchor, 10)
        stackView.rightAnchor(contentView.rightAnchor, -10)
        stackView.bottomAnchor(contentView.bottomAnchor, -10)
    }
}

// MARK: Set data

extension TableCell {
    
    func setDataToCell(_ data: WeatherData) {
        
        imageWeather.image = UIImage(systemName: "applelogo")
        temperatureLabel.text = "Temperature: \(Int(data.main.temp) - 273)˚C"
        dateLabel.text = "Date: \(data.dt_txt)"
    }
}
