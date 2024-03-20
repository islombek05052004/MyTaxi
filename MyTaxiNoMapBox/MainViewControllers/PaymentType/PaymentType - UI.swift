//
//  PaymentType - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 09/02/24.
//

import UIKit

final class PaymentTypeVCHomeView: UIView {
    
    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .insetGrouped)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        toFormUIElements()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PaymentTypeVCHomeView {
    
    private func toFormUIElements() {
        
        tableView.register(PaymentTypeVCTableCell.self, forCellReuseIdentifier: PaymentTypeVCTableCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
        
        tableView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 0)
        tableView.leftAnchor(self.leftAnchor, 0)
        tableView.rightAnchor(self.rightAnchor, 0)
        tableView.bottomAnchor(self.bottomAnchor, 0)
    }
}
