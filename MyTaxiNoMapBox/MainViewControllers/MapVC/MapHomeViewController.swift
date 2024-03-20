//
//  MapHomeViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 19/01/24.


import UIKit
//import Mapbox


final class MapHomeViewController: UIViewController {
    
    private var showSideMenu: Bool = false
    
    private var mglMapView = UIView()
    private lazy var mapView: UIView = mglMapView

    private let sideMenuData = SideMenuListDataManager.shared.getListData()
    private let sideMenuView = SideMenuView()
    
    override func loadView() {
        self.view = mapView
        mapView.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationItems()
        setDelegates()
        view.addSubview(sideMenuView)
        create_myLocationButton()
        setSwipeGestureRegonsize()
        self.createPointA()
        self.createPointB()
    }
    
    private func setSwipeGestureRegonsize() {
        
        let hideSideMenu = UISwipeGestureRecognizer(target: self, action: #selector(menuTapped))
        hideSideMenu.direction = .left
        sideMenuView.addGestureRecognizer(hideSideMenu)
    }
    
    @objc func myLocationPressed() {
//        mglMapView.setCenter(LocationManager.shared.coordinate, animated: true)
    }
}

//MARK: setUpTracingLine

extension MapHomeViewController {
    
    private func createPointA() {
//        let annotation = MGLPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 41.297735,
//                                                       longitude: 69.248904)
//        annotation.title = "point_a"
//        self.mglMapView.addAnnotation(annotation)
    }
    
    private func createPointB() {
//        let annotation = MGLPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 41.341118,
//                                                       longitude: 69.287921)
//        annotation.title = "point_b"
//        self.mglMapView.addAnnotation(annotation)
        
    }
}

// MARK: SetUp delegates

extension MapHomeViewController {
    
    private func setDelegates() {
//        mglMapView.delegate = self
//        sideMenuView.tableView.dataSource = self
//        sideMenuView.tableView.delegate = self
    }
    
    func create_myLocationButton() {
    let button = UIButton(type: .system)
    button.tintColor = .black
    
    
    button.alpha = 0
    button.setImage(UIImage(systemName: "applelogo"),
                    for: .normal)
    button.contentMode = .center
    
    
    button.addTarget(self,
                        action: #selector(myLocationPressed),
                        for: .touchUpInside)
    button.backgroundColor = UIColor.init(white: 1, alpha: 0.7)
    button.contentVerticalAlignment = .center
    button.contentHorizontalAlignment = .center
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 2)
    button.clipsToBounds = false
    button.layer.cornerRadius = 22.5
    button.layer.opacity = 1
    button.layer.shadowRadius = 11.11
    button.layer.shadowOffset = CGSize(width: 0, height: 0)
    button.layer.shadowOpacity = 1
    button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
    
    
//    self.mglMapView.addSubview(button)
    
    
    button.frame = .init(x: 100, y: 600, width: 60, height: 60)
}
}

// MARK: table view delegates

extension MapHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int { sideMenuData.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberRowsInSection(section: section, sideMenuData: sideMenuData)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableViewCell(tableView: tableView, cellForRowAt: indexPath) as? SideMenuCell else { return UITableViewCell()}
        
        cell.setDataToCell(data: sideMenuData[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSideMenuElement(section: indexPath.section, indexPath: indexPath)
    }
}

// MARK: sideMenu

extension MapHomeViewController {
    
    private func setUpNavigationItems() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease"),
            style: .done,
            target: self,
            action: #selector(menuTapped)
        )
    }
    
    @objc func menuTapped() { sideMenu(isShow: &showSideMenu, needScrollView: sideMenuView) }
}

//extension MapHomeViewController: MGLMapViewDelegate {
//
//    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
//        guard let optionalTitle = annotation.title, let title = optionalTitle else { return nil }
//
//        var annotationView = self.mglMapView.dequeueReusableAnnotationView(withIdentifier: title)
//
//        if let image = UIImage(named: "user"), annotation.title == "point_a" {
//
//            annotationView = CustomAnnotationView(reuseIdentifier: title, image: image)
//            return annotationView
//
//        } else if let image = UIImage(named: "taxi"), annotation.title == "point_b" {
//
//            annotationView = CustomAnnotationView(reuseIdentifier: title, image: image)
//            return annotationView
//        }
//        return nil
//    }
//}
