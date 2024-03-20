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
    var weatherData = [WeatherData]()
    
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
        
        ApiManager.shared.weatherApiManager(ApiValues.getUrlString("london")) { arrData, error in
            if let arrData = arrData {
                
                DispatchQueue.main.async {
                    self.weatherData = arrData
                    self.presenter.view.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.view.tableView.delegate = self
        self.presenter.view.tableView.dataSource = self
        self.presenter.view.segmentedControll.addTarget(self, action: #selector(changeValueSegmentControll), for: .valueChanged)
        setUpBackButton()
    }
    
    @objc func changeValueSegmentControll(segmentControll: UISegmentedControl) {
        self.presenter.changeValuesSegmentControll(segmentControll: segmentControll)
    }
}

extension TravellsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableCell.identifier,
            for: indexPath
        ) as? TableCell else { return UITableViewCell() }
        cell.setDataToCell(weatherData[indexPath.row])
        return cell
    }
}
