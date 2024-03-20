//
//  AccountVC - Protocol.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit


protocol AccoundViewControllerProtocol {
    
    func deleteAccount()
    func numberOfSections() -> Int
    func numberRowsInSection(numberOfRowsInSection section: Int) -> Int
    func didSelectRow(indexPath: IndexPath)
    func setNavigationBtns()
}

extension AccountViewController: AccoundViewControllerProtocol {
    
    
    func didSelectRow(indexPath: IndexPath) {
        if indexPath.section == 1 {
            
            let alertVC = UIAlertController(
                title: "Profilni o'chirish",
                message: "Bu amalda sizning barcha kartalaringiz, sayohatlaringiz va malumotlariz to'liq o'chib ketadi. Bu amalni to'xtatib bo'lmaydi.",
                preferredStyle: .alert
            )
            
            let noAction = UIAlertAction(title: "Bekor qilish", style: .cancel)
            let deleteAction = UIAlertAction(title: "O'chirish", style: .destructive) { UIAlertAction in
                UserDefaultsManager.shared.deleteAccountData()
                let homeVC = HomeViewController()
                homeVC.navigationItem.leftBarButtonItem = nil
                self.pushVC(with: homeVC)
            }
            alertVC.addAction(noAction)
            alertVC.addAction(deleteAction)
        
            self.present(alertVC, animated: true)
        }
    }    
        
    func setNavigationBtns() {
        
        let editButton = UIBarButtonItem(
            title: "Tahrirlash",
            style: .done,
            target: self,
            action: #selector(editButtonTapped)
        )
        navigationItem.rightBarButtonItem = editButton
    }
    
    func numberRowsInSection(numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 4
        case 1: return 1
        default: return 0
        }
    }
    
    func numberOfSections() -> Int { 2 }
        
    func deleteAccount() { popVC() }
}
