//
//  TariffViewController.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 19/02/24.
//

import UIKit

class TariffViewController: UIViewController {

    let mainView = TariffVCHomeView()
    
    override func loadView() {
        self.view = mainView
        setUpBackButton()
        title = "Tariflar"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
