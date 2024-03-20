//
//  Notification - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

final class NotificationHomeView: UIView {
    
    let tableView = UITableView()
    
    private let noNewLabel = UILabel(text: "Hozircha yangiliklar mavjud emas",
                             textColor: .gray,
                             textAlignment: .center,
                             font: .systemFont(ofSize: 16, weight: .regular))
    
    private let bellImageView = UIImageView(image: UIImage(named: "bellImage"),
                                            contentMode: .scaleAspectFit)
    
    let stackView = UIStackView(arrangedSubviews: [],
                                axis: .vertical,
                                spacing: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NotificationHomeView {
    
    private func toFormUIElements() {
        
        stackView.addArrangedSubview(bellImageView)
        stackView.addArrangedSubview(noNewLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .systemGray6
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
        addSubview(stackView)
        
        tableView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 0)
        tableView.leftAnchor(leftAnchor, 0)
        tableView.rightAnchor(rightAnchor, 0)
        tableView.bottomAnchor(bottomAnchor, 0)
        
        stackView.centerXAnchor(self.centerXAnchor, 0)
        stackView.centerYAnchor(self.centerYAnchor, 0)
        stackView.widhtHeight(250, 250)
    }
}
