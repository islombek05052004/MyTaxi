//
//  TravellsViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class TravellsViewController: UIViewController {

    private var presenter: TravelsVCPresentable
    private let mainView = TravelsHomeView()
    
    init() {
        self.presenter = TravelsVCProtocol()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        view.backgroundColor = .white
        title = "Mening safarlarim"
        setUpBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
        setTargetFunctions()
    }
    
    private func setDelegates() {
        self.presenter.view.tableView.delegate = self
        self.presenter.view.tableView.dataSource = self
    }
    
    private func setTargetFunctions() {
        self.presenter.view.segmentedControll.addTarget(self,
                                                        action: #selector(changeValueSegmentControll),
                                                        for: .valueChanged)
    }
    
    @objc func changeValueSegmentControll(segmentControll: UISegmentedControl) {
        self.presenter.changeValuesSegmentControll(segmentControll: segmentControll)
    }
}

extension TravellsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.presenter.tableView(tableView, cellForRowAt: indexPath) else { return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travellInformationVC = TravellInformationViewController()
        self.pushVC(with: travellInformationVC)
    }
}
