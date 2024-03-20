//
//  Notification - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

protocol NotificationVCPresentable: AnyObject {
    var viewController: NotificationViewController! { get set }
    var view: NotificationHomeView! { get set }
    
    
    func setNavigationButtons()
    
}

final class NotificationVCPresenter: NotificationVCPresentable {
    
    var viewController: NotificationViewController!
    var view: NotificationHomeView!
    
    func setNavigationButtons() {
        
        viewController.setUpBackButton()
        
        self.viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "readIcon")?.withTintColor(.systemGray),
            style: .done,
            target: viewController.self,
            action: #selector(viewController.readNavigationButtonTapped)
        )
        self.viewController.navigationItem.rightBarButtonItem?.isEnabled = false
    }
}
