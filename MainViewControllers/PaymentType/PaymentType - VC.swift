//
//  PaymentTypeViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class PaymentTypeViewController: UIViewController {
    
    private var presenter: PaymentTypeVCPresentable
    private let mainView = PaymentTypeVCHomeView()
    
    init() {
        self.presenter = PaymentTypeVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        self.title = "To'lov turi"
        setUpBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        presenter.updateTableData(with: PaymentTypeLocalDataManager.shared.fetchData())
        presenter.view.tableView.reloadData()
        mainView.tableView.reloadData()
    }
}

extension PaymentTypeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.presenter.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.tableView(didSelectRowAt: indexPath)
    }
}
