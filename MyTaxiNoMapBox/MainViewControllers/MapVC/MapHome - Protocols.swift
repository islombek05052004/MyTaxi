//
//  MapHome - Protocols.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

protocol SideMenuProtocol {
    
    func numberRowsInSection(section: Int, sideMenuData: [[SideMenuDataModel]]) -> Int
    func sideMenu(isShow: inout Bool, needScrollView: UIView)
    func selectedSideMenuElement(section: Int, indexPath: IndexPath)
    func tableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

extension MapHomeViewController: SideMenuProtocol {
    
    func tableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as! SideMenuCell
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        return cell
    }
    
    func numberRowsInSection(section: Int, sideMenuData: [[SideMenuDataModel]]) -> Int {
        switch section {
        case 0: return sideMenuData[0].count
        case 1: return sideMenuData[1].count
        case 2: return sideMenuData[2].count
        case 3: return sideMenuData[3].count
        default: return 0
        }
    }
    
    func sideMenu( isShow: inout Bool, needScrollView: UIView) {
        
        if isShow {
            UIView.animate(withDuration: 0.4) {
                needScrollView.frame.origin.x = 0
            }
            isShow = false
            return
        }
        UIView.animate(withDuration: 0.4) {
            needScrollView.frame.origin.x = -350
        }
        isShow = true
    }
    
    func selectedSideMenuElement(section: Int, indexPath: IndexPath) {
        
        switch (section, indexPath.row) {
            
        case (0, 0) :
            pushVC(with: AccountViewController())
            
        case (1, 0):
            pushVC(with: TravellsViewController())
            
        case (1, 1):
            pushVC(with: SelectedAdressViewController())
            
        case (2, 0):
            pushVC(with: PaymentTypeViewController())
            
        case (2, 1):
            pushVC(with: PromocodViewController())
            
        case (2, 2):
            pushVC(with: BusinessViewController())
            
        case (3, 0):
            pushVC(with: NotificationViewController())
            
        case (3, 1):
            pushVC(with: HelpViewController())
            
        case (3, 2):
            pushVC(with: SettingsViewController())
        
        case (_, _):
            return
        }
    }
}
