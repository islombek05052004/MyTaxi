//
//  UIViewController+.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 13/01/24.
//

import UIKit

protocol UIViewControllerProtocol {
    
    func pushVC(with vc: UIViewController, animated: Bool )
    func popVC()
    func present(with vc: UIViewController)
    
}

extension UIViewController: UIViewControllerProtocol {
    
    func pushVC(with vc: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    func popVC() {
        navigationController?.popViewController(animated: true )
    }
    
    func present(with vc: UIViewController) {
        present(vc, animated: true)
    }
    
    func alertVC(title: String?, message: String?, preferredStyle: UIAlertController.Style) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
    
    func setUpBackButton() {

        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward"),
            style: .done,
            target: self,
            action: #selector(backTapped)
        )
        backButton.tintColor = .gray
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backTapped() { popVC() }
}
