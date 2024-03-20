//
//  SelectedPermanentAddressVC - Presenter.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 12/02/24.
//

import UIKit

protocol SelectedPermanentAddressVCPresentable: AnyObject {
    
    var view: SelectedPermanentAddressVCHomeView! { get set }
    var viewController: SelectedPermanentAddressViewController! { get set }
    
}
 
final class SelectedPermanentAddressVCPresenter: SelectedPermanentAddressVCPresentable {
    
    weak var view: SelectedPermanentAddressVCHomeView!
    weak var viewController: SelectedPermanentAddressViewController!
}
