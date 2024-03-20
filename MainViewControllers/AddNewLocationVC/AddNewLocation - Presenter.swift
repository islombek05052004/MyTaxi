//
//  AddNewLocationVC - Presenter.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 16/02/24.
//

import UIKit

protocol AddNewLocationVCPresentable: AnyObject {
    
    var view: AddNewLocationVCHomeView! { get set }
    var viewController: AddNewLocationVC! { get set }
    
    
}
 
final class AddNewLocationVCPresenter: AddNewLocationVCPresentable {
    var view: AddNewLocationVCHomeView!
    
    var viewController: AddNewLocationVC!
    
    
}
