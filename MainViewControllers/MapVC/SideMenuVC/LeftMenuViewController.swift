//
//  LeftMenuViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 24/01/24.
//

import UIKit

class LeftMenuViewController: UIViewController {
    
    private let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    private let sideMenuView = SideMenuView() 
    
    override func loadView() {
        view = self.sideMenuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
    }
}
