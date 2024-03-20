//
//  Calendar - Presenter.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 22/02/24.
//

import UIKit

protocol CalendarVCPresentable: AnyObject {
    
    var view: CalendarVCHomeView! { get set }
    var viewController: CalendarViewController! { get set }
    
    func dateSelected(picker: UIDatePicker)
}

final class CalendarVCPresenter: CalendarVCPresentable {
    
    weak var view: CalendarVCHomeView!
    weak var viewController: CalendarViewController!
    
    func dateSelected(picker: UIDatePicker) {
        
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .short
        dataFormatter.locale = Locale(identifier: "uz_UZ")
        
        let dataValue = dataFormatter.string(from: picker.date)
    
        viewController.delegate?.updateBirthdayData(date: dataValue)
    }
}
