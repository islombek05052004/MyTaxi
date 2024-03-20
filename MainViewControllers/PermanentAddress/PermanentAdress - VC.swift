//
//  PermanentAddress.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class PermanentAddressViewController: UIViewController {

    private let mainView = PermanentAdressVCHomeView()
    private var presenter: PermanentAdressVCPresentable
    
    init() {
        self.presenter = PermanentAdressVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        title = "Doimiy manzillar"
        setUpBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        
    }
    private func setDelegates(){
        
        self.mainView.collectionView.delegate = self
        self.mainView.collectionView.dataSource = self
    }
}

extension PermanentAddressViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.presenter.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.didSelectRow(indexPath: indexPath)
    }
}
