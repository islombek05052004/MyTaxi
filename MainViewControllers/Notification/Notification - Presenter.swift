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
}

final class NotificationVCPresenter: NotificationVCPresentable {
    
    var viewController: NotificationViewController!
    var view: NotificationHomeView!
}
