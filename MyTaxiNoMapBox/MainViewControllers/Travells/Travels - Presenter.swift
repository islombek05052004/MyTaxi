//
//  Travels - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

protocol TravelsVCPresentable: AnyObject {
    
    var viewController: TravellsViewController! { get set }
    var view: TravelsHomeView! { get set }
    
    func updateTableView()
    func changeValuesSegmentControll(segmentControll: UISegmentedControl)
    
}

final class TravelsVCProtocol: TravelsVCPresentable {
    
    weak var viewController: TravellsViewController!
    weak var view: TravelsHomeView!
    
    func changeValuesSegmentControll(segmentControll: UISegmentedControl) {
        
        if segmentControll.selectedSegmentIndex == 1 {
            
            DispatchQueue.main.async {
                ApiManager.shared.weatherApiManager(ApiValues.getUrlString("london")) { arrdata, error in
                    if let arrdata = arrdata {
                        self.viewController.weatherData = arrdata

                    }
                }
                self.view.noTravelsLabel.isHidden = true
                self.view.noDataImageView.isHidden = true
                self.view.tableView.isHidden = false
                self.view.tableView.reloadData()
            }
            
        } else {
            
            DispatchQueue.main.async {
                self.view.noTravelsLabel.isHidden = false
                self.view.noDataImageView.isHidden = false
                self.view.tableView.isHidden = true
            }
        }
    }
    
    func updateTableView() {
        
    }    
}
