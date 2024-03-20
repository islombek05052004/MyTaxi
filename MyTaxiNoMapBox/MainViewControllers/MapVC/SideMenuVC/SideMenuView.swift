//
//  SideMenuView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 24/01/24.
//

import UIKit


class SideMenuView: UIView {
    
    var sideMenuTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sideMenuTableView.backgroundColor = .white

        addSubview(sideMenuTableView)
        backgroundColor = .black.withAlphaComponent(0.1)
        
        sideMenuTableView.leftAnchor(self.leftAnchor, 0)
        sideMenuTableView.topAnchor(self.topAnchor, 0)
        sideMenuTableView.bottomAnchor(self.bottomAnchor, -50)
        sideMenuTableView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

