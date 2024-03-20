//
//  MapHome - Protocols.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

protocol MapVCPresentable: AnyObject {
    
    var sideMenuView: SideMenuView! { get set }
    var mapVC: MapHomeViewController! { get set }
    
    func numberRowsInSection(section: Int, sideMenuData: [[SideMenuDataModel]]) -> Int
    func sideMenu(isShow: inout Bool)
    func selectedSideMenuElement(section: Int, row: Int)
    func tableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

final class MapVCPresenter: MapVCPresentable {
    weak var sideMenuView: SideMenuView!
    weak var mapVC: MapHomeViewController!
    
    func tableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as! SideMenuCell
        
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        return cell
    }
    
    func numberRowsInSection(section: Int, sideMenuData: [[SideMenuDataModel]]) -> Int {
        switch section {
        case 0: return sideMenuData[0].count
        case 1: return sideMenuData[1].count
        case 2: return sideMenuData[2].count
        default: return 0
        }
    }
    
    func sideMenu(isShow: inout Bool) {
        
        if isShow {
            
//            self.mapVC.navigationItem.leftBarButtonItem?.isHidden = true
            
            UIView.animate(withDuration: 0.4) {
                self.sideMenuView.frame.origin.x = 0
            } completion: { Bool in
                UIView.animate(withDuration: 0.2) {
                    self.sideMenuView.backTapView.alpha = 0.1
                }
            }
            isShow = false
            
        } else {
            
            self.sideMenuView.backTapView.alpha = 0

            UIView.animate(withDuration: 0.4) {
                self.sideMenuView.frame.origin.x = -Paddings.deviceBounds.width
            } completion: { Bool in
//                self.mapVC.navigationItem.leftBarButtonItem?.isHidden = false
            }
            isShow = true
        }
    }
    
    func selectedSideMenuElement(section: Int, row: Int) {
        
        switch (section, row) {
            
        case (0, 0):
            mapVC.pushVC(with: TravellsViewController())
            
        case (0, 1):
            mapVC.pushVC(with: PermanentAddressViewController())
            
        case (1, 0):
            mapVC.pushVC(with: PaymentTypeViewController())
            
        case (1, 1):
            mapVC.pushVC(with: PromocodViewController())
            
        case (1, 2):
            mapVC.pushVC(with: BusinessViewController())
            
        case (2, 0):
            mapVC.pushVC(with: NotificationViewController())
            
        case (2, 1):
            mapVC.pushVC(with: HelpViewController())
            
        case (2, 2):
            mapVC.pushVC(with: SettingsViewController())
        
        case (_, _):
            return
        }
    }
}
