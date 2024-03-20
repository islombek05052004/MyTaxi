//
//  SideMenuView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit


class SideMenuView: UIView {
    
    let tableView: UITableView = {
       
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .insetGrouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: SideMenuCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: -350,
                            y: 0,
                            width: 350,
                            height: Paddings.deviceBounds.height)
        
        addSubview(tableView)
        backgroundColor = .systemGray6

        tableView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 0)
        tableView.leftAnchor(self.leftAnchor, 0)
        tableView.widhtHeight(300, UIScreen.main.bounds.height * 0.8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
