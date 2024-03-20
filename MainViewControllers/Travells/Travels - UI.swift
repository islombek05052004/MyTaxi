//
//  Travels - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

final class TravelsHomeView: UIView {
    
    let segmentedControll = UISegmentedControl()
    let noDataImageView = UIImageView(image: UIImage(named: "location"), contentMode: .scaleAspectFit)
    let noTravelsLabel = UILabel(text: "Xorirgi vaqtda sizda safarlar mavjud emas",
                                 textColor: .gray,
                                 textAlignment: .center,
                                 font: .systemFont(ofSize: 18, weight: .regular))
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TravelsHomeView {
    
    private func setUpUIElements() {
        
        segmentedControll.backgroundColor = .systemGray6
        segmentedControll.selectedSegmentTintColor = .white
        segmentedControll.insertSegment(withTitle: "Yakunlangan", at: 0, animated: true)
        segmentedControll.setTitleTextAttributes([ .font: UIFont.systemFont(ofSize: 19, weight: .semibold)],
                                                 for: .normal)
        segmentedControll.insertSegment(withTitle: "Bekor qilingan", at: 1, animated: true)
        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.setShadow(0, 0, UIColor.gray.cgColor, 0.5, 5)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(TravelsTableViewCell.self, forCellReuseIdentifier: TravelsTableViewCell.identifier)
        
        noTravelsLabel.numberOfLines = 0
        
        addSubview(segmentedControll)
        addSubview(noDataImageView)
        addSubview(noTravelsLabel)
        addSubview(tableView)
        
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        noDataImageView.translatesAutoresizingMaskIntoConstraints = false
        noTravelsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControll.topAnchor(self.safeAreaLayoutGuide.topAnchor, 0)
        segmentedControll.leftAnchor(self.leftAnchor, 20)
        segmentedControll.rightAnchor(self.rightAnchor, -20)
        segmentedControll.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tableView.topAnchor(self.segmentedControll.bottomAnchor, 10)
        tableView.leftAnchor(leftAnchor, 0)
        tableView.rightAnchor(rightAnchor, 0)
        tableView.bottomAnchor(bottomAnchor, 0)
        
        noDataImageView.centerYAnchor(self.centerYAnchor, 0)
        noDataImageView.centerXAnchor(self.centerXAnchor, 0)
        noDataImageView.widhtHeight(200, 200)
        noDataImageView.isHidden = true
        
        noTravelsLabel.topAnchor(noDataImageView.bottomAnchor, 10)
        noTravelsLabel.centerXAnchor(centerXAnchor, 0)
        noTravelsLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
    }
}
