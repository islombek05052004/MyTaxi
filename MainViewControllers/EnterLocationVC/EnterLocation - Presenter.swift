//
//  EnterLocation - Presenter.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 11/03/24.
//

import UIKit

protocol EnterLocationVCPresentable: AnyObject {
    
    var view: EnterLocationVCHomeView! { get set }
    var viewController: EnterLocationVC! { get set }
    
}

final class EnterLocationVCPresenter: EnterLocationVCPresentable {
    
    var view: EnterLocationVCHomeView!
    var viewController: EnterLocationVC!
    
    
    
    
}
