//
//  CustomerService - Presenter.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 14/02/24.
//

import UIKit

protocol CustomerServiceVCPresentable: AnyObject {
    
    var view: CustomerServiceVCHomeView! { get set }
    var viewController: CustomerServiceVC! { get set }
    
}

final class CustomerServiceVCPresenter: CustomerServiceVCPresentable {
    
    weak var view: CustomerServiceVCHomeView!
    weak var viewController: CustomerServiceVC!
}
