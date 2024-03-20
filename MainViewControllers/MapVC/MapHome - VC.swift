//
//  MapHomeViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 19/01/24.


import UIKit
//import Mapbox

final class MapHomeViewController: UIViewController {
    
    private var preserter: MapVCPresentable
    
    private var showSideMenu: Bool = false
//    private var mglMapView = UIView()
    private lazy var mapView: UIView = UIView()

    private var sideMenuData = SideMenuListDataManager.shared.getListData()
    private let sideMenuView = SideMenuView()
    
    init() {
        self.preserter = MapVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.preserter.mapVC = self
        self.preserter.sideMenuView = sideMenuView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mapView
        mapView.backgroundColor = .cyan
        setUpNavigationItems()
        view.addSubview(sideMenuView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.sideMenuView.headerView.updateInformationHeaderView()
        self.sideMenuData = SideMenuListDataManager.shared.getListData()
        self.sideMenuView.tableView.reloadData()
    }
    
    private func setDelegates() {
        sideMenuView.tableView.dataSource = self
        sideMenuView.tableView.delegate = self
        setSwipeGestureRegonsize()
    }
    
    private func setSwipeGestureRegonsize() {
        
        let hideSideMenu = UISwipeGestureRecognizer(target: self, action: #selector(menuTapped))
        hideSideMenu.direction = .left
        sideMenuView.addGestureRecognizer(hideSideMenu)
        
        let hiddenWhenTapped = UITapGestureRecognizer(target: self, action: #selector(menuTapped))
        hideSideMenu.numberOfTouchesRequired = 1
        sideMenuView.backTapView.addGestureRecognizer(hiddenWhenTapped)
    }
    
    @objc func accoundHeaderViewTapped() {
        pushVC(with: AccountViewController())
    }
}


// MARK: table view delegates

extension MapHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int { sideMenuData.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        preserter.numberRowsInSection(section: section, sideMenuData: sideMenuData)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.preserter.tableViewCell(tableView: tableView, cellForRowAt: indexPath) as? SideMenuCell else { return UITableViewCell() }

        let dataSection = sideMenuData[indexPath.section]
        let dataCell = dataSection[indexPath.row]

        cell.setDataToCell(data: dataCell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        preserter.selectedSideMenuElement(section: indexPath.section, row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.54
    }
}

// MARK: SideMenu Animations

extension MapHomeViewController {
    
    private func setUpNavigationItems() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "mapVCmenu")?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(menuTapped)
        )
    }
        
    @objc func menuTapped() { preserter.sideMenu(isShow: &showSideMenu) }
}
