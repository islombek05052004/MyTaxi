//
//  PermanentAdress - Presenter.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 11/02/24.
//

import UIKit

protocol PermanentAdressVCPresentable: AnyObject {
    
    var view: PermanentAdressVCHomeView! { get set }
    var viewController: PermanentAddressViewController! { get set }
 
    func numberOfItemsInSection(section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func didSelectRow(indexPath: IndexPath)
}

final class PermanentAdressVCPresenter: PermanentAdressVCPresentable {
    
    weak var view: PermanentAdressVCHomeView!
    weak var viewController: PermanentAddressViewController!
    
    private var dataCollectionView = PermanentAdressDataManager.shared.getData()
    
    func numberOfItemsInSection(section: Int) -> Int {
        return dataCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PerAdressCollViewCell.identifier,
            for: indexPath) as! PerAdressCollViewCell
        
        let data = dataCollectionView[indexPath.row]
        cell.toFormCell(with: data)
        return cell
    }
    
    func didSelectRow(indexPath: IndexPath) {
        
        let selectedAddressVC = SelectedPermanentAddressViewController()
        selectedAddressVC.modalPresentationStyle = .overFullScreen
        self.viewController.present(with: selectedAddressVC)
    }
}
