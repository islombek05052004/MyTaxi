//
//  PermanentAdress - UI.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 11/02/24.
//

import UIKit

final class PermanentAdressVCHomeView: UIView {
    
    var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: Paddings.deviceBounds.width * 0.45,
                                 height: Paddings.deviceBounds.width * 0.35)
        layout.sectionInset = UIEdgeInsets(top: 40,
                                           left: Paddings.deviceBounds.width * 0.03,
                                           bottom: 10,
                                           right: Paddings.deviceBounds.width * 0.03)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        toFormUIElements()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PermanentAdressVCHomeView {
    
    private func toFormUIElements() {
        
        collectionView.backgroundColor = .clear
        collectionView.register(PerAdressCollViewCell.self,
                                forCellWithReuseIdentifier: PerAdressCollViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(collectionView)
        
        collectionView.leftAnchor(leftAnchor, 0)
        collectionView.rightAnchor(rightAnchor, 0)
        collectionView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 0)
        collectionView.bottomAnchor(bottomAnchor, 0)
    }    
}
