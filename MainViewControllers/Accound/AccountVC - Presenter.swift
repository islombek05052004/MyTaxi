//
//  AccountVC - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit

protocol AccoundVCPresentable: AnyObject {
    
    var view: AccountVCHomeView! { get set }
    var viewController: AccountViewController! { get set }
    
    func accountImageTapped()
    
    func presentImagePickerVC()
    func deleteAccount()
    func numberOfSections() -> Int
    func numberRowsInSection(numberOfRowsInSection section: Int) -> Int
    func didSelectRow(indexPath: IndexPath)
    func editButtonTapped()
}

final class AccoundVCPresenter: AccoundVCPresentable {
    
    weak var view: AccountVCHomeView!
    weak var viewController: AccountViewController!
    
    func presentImagePickerVC() {
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.allowsEditing = true
        imagePickerVC.modalPresentationStyle = .fullScreen
        imagePickerVC.delegate = self.viewController
        
        self.viewController.present(imagePickerVC, animated: true)
    }
    
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
                self.viewController.pushVC(with: homeVC)
            }
            alertVC.addAction(noAction)
            alertVC.addAction(deleteAction)
        
            self.viewController.present(alertVC, animated: true)
        }
    }

    func numberRowsInSection(numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 3
        case 1: return 1
        default: return 0
        }
    }
    
    func numberOfSections() -> Int { 2 }
        
    func deleteAccount() { self.viewController.popVC() }
    
    func accountImageTapped() {
        
        let alertVC = UIAlertController(title: "Akkauntingiz rasmi",
                                        message: nil,
                                        preferredStyle: .actionSheet)
        
        let addAction = UIAlertAction(title: "Rasm quyish", style: .default) { UIAlertAction in
            self.presentImagePickerVC()
        }
        
        let removeAction = UIAlertAction(title: "Rasmni olib tashlash", style: .default) { UIAlertAction in
            UserDefaultsManager.shared.deleteAccountImage()
            self.view.accoundHeaderView.updateHeaderElements()
        }
        
        let backAction = UIAlertAction(title: "Bekor qilish", style: .cancel)
        
        alertVC.addAction(addAction)
        alertVC.addAction(removeAction)
        alertVC.addAction(backAction)

        self.viewController.present(with: alertVC)
    }
    
    func editButtonTapped() {
        
        let accountAlertVC = AccoundAlertViewController()
        accountAlertVC.AccoundVC = viewController
        accountAlertVC.modalPresentationStyle = .pageSheet
        
        if #available(iOS 15, *), let sheet = accountAlertVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        viewController.present(accountAlertVC, animated: true)
    }
}
