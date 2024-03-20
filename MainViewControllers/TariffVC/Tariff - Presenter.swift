//
//  Tariff - Presenter.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 20/02/24.
//

import UIKit

protocol TariffViewControllerPresentable: AnyObject {
    
    var view: TariffVCHomeView! { get set }
    var viewController: TariffViewController! { get set }
    
    func tariffBtnsSelected(with btnTag: Int)
}

final class TariffViewControllerPresenter: TariffViewControllerPresentable {
    
    weak var view: TariffVCHomeView!
    
    weak var viewController: TariffViewController!
    
    func tariffBtnsSelected(with btnTag: Int) {
        
        for tag in CarTariffType.allCases {
            
            if let btn = self.view.viewWithTag(tag.rawValue) as? UIButton {
                
                if tag.rawValue == btnTag {
                    btn.setTitleColor(.black, for: .normal)
                    btn.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
                } else {
                    btn.setTitleColor(.systemGray4, for: .normal)
                    btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
                }
            }
        }
    }
}
