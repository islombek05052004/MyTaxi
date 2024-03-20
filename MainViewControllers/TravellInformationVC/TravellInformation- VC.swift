//
//  TravellInformationViewController.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 23/02/24.
//

import UIKit

class TravellInformationViewController: UIViewController {
    
    private let mainView = TravellInformationVCHomeView()
    
    override func loadView() {
        self.view = mainView
        setUpBackButton()
        title = "Mening safarlarim"
        self.navigationController?.navigationBar.standardAppearance.backgroundColor = .white
        self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = .white
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.standardAppearance.backgroundColor = .clear
        self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = .clear
    }
}
