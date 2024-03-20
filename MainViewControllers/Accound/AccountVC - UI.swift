//
//  AccountView - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit


class AccountVCHomeView: UIView {

    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0),
                                style: .insetGrouped)
    
    let accoundHeaderView = AccoundTableHeaderView(
        frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        
        toFormUIElements()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountVCHomeView {
        
    private func toFormUIElements() {
        
        tableView.backgroundColor = .clear
        tableView.tableHeaderView = accoundHeaderView
        tableView.register(
            AccoundTableViewCell.self,
            forCellReuseIdentifier: AccoundTableViewCell.identifier
        )
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setConstraints() {
        
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 0)
        tableView.bottomAnchor(bottomAnchor, 0)
        tableView.leftAnchor(leftAnchor, 0)
        tableView.rightAnchor(rightAnchor, 0)
    }
}

