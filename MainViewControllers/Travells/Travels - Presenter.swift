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
    
    func changeValuesSegmentControll(segmentControll: UISegmentedControl)
    func numberOfRowsInSection(section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TravelsTableViewCell?
    
}

final class TravelsVCProtocol: TravelsVCPresentable {
    
    weak var viewController: TravellsViewController!
    weak var view: TravelsHomeView!
    
    func changeValuesSegmentControll(segmentControll: UISegmentedControl) {
        
        if segmentControll.selectedSegmentIndex == 1 {

            self.view.noTravelsLabel.isHidden = false
            self.view.noDataImageView.isHidden = false
            self.view.tableView.isHidden = true
            self.view.tableView.reloadData()

        } else {

            self.view.noTravelsLabel.isHidden = true
            self.view.noDataImageView.isHidden = true
            self.view.tableView.isHidden = false
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TravelsTableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TravelsTableViewCell.identifier,
            for: indexPath) as? TravelsTableViewCell else { return nil }
        cell.selectionStyle = .none
        return cell
    }
}
