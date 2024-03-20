//
//  Promocod - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

protocol PromocodVCPresentable: AnyObject {
    var viewController: PromocodViewController! { get set }
    var view: PromocodVCView! { get set }
    func addPromocodBtnClick()
    
}

final class PromocodVCPresenter: PromocodVCPresentable {
    
    weak var viewController: PromocodViewController!
    weak var view: PromocodVCView!
    
    func addPromocodBtnClick() {
        self.viewController.navigationController?.pushViewController(AddPromocodViewController(), animated: false)
    }
}
