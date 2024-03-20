//
//  PaymentType - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 09/02/24.
//

import UIKit

protocol PaymentTypeVCPresentable: AnyObject {
    
    var view: PaymentTypeVCHomeView! { get set }
    var viewController: PaymentTypeViewController! { get set }
    
    func tableView(didSelectRowAt indexPath: IndexPath)
    func numberOfSections() -> Int
    func numberOfRowsInSection(section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    func updateTableData(with data: [[PaymentTypeTableCellModel]])
}

final class PaymentTypeVCPresenter: PaymentTypeVCPresentable {
    func updateTableData(with data: [[PaymentTypeTableCellModel]]) {
        self.tableData = PaymentTypeLocalDataManager.shared.fetchData()
        self.view.tableView.reloadData()
    }
    
    
    var view: PaymentTypeVCHomeView!
    var viewController: PaymentTypeViewController!
    
    private var tableData = PaymentTypeLocalDataManager.shared.fetchData()
    
    func numberOfSections() -> Int { tableData.count }
    
    func numberOfRowsInSection(section: Int) -> Int {
        
        switch section {
        case 0: return tableData[0].count
        case 1: return tableData[1].count
        case 2: return tableData[2].count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PaymentTypeVCTableCell.identifier, for: indexPath) as! PaymentTypeVCTableCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.giveFormToCell(with: tableData[indexPath.section][indexPath.row], indexPath: indexPath)
        return cell
    }
    
    func tableView(didSelectRowAt indexPath: IndexPath) {
        
        switch (indexPath.section, indexPath.row) {
            
        case (0, 0):
            return
        case (0, 1):
            self.viewController.pushVC(with: StartBusinessVC())
        case (0, 2):
            self.viewController.pushVC(with: AddPlasticCardVC())
        case (1, 0):
            self.viewController.pushVC(with: ActicateBonusVC())
            
        case (_, _):
            return
        }
    }
}

