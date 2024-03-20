//
//  AppDelegate.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 11/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let mainVC = needViewController()
        setNavigationBarApperance()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: mainVC)
        window?.makeKeyAndVisible()
        
        LocationManager.shared.requestLocation()
        
        return true
    }
}

extension AppDelegate {
    
    private func setNavigationBarApperance() {
        
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .clear
        apperance.shadowColor = .clear
        apperance.shadowColor = nil
        
        UINavigationBar.appearance().standardAppearance = apperance
        UINavigationBar.appearance().scrollEdgeAppearance = apperance
    }
    
    private func needViewController() -> UIViewController {
        
        guard UserDefaultsManager.shared.getAccoundData() != nil else { return HomeViewController()}
        return MapHomeViewController()
    }
}

