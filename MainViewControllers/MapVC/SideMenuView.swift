//
//  SideMenuView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit


class SideMenuView: UIView {
    
    let headerView =  SideMenuHeaderView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    
    let backTapView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.frame = CGRect(x: 0, y: 0, width: Paddings.deviceBounds.width, height: Paddings.deviceBounds.height)
        return view
    }()
    
    let tableView: UITableView = {
       
        let tableView = UITableView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 300,
                                                  height: Paddings.deviceBounds.height),
                                    style: .grouped)
        
        tableView.sectionHeaderHeight = 10
        tableView.backgroundColor = .systemGray6
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: SideMenuCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: -Paddings.deviceBounds.width,
                            y: 0,
                            width: Paddings.deviceBounds.width,
                            height: Paddings.deviceBounds.height)
        
        addSubview(backTapView)
        addSubview(tableView)

        tableView.tableHeaderView = headerView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
