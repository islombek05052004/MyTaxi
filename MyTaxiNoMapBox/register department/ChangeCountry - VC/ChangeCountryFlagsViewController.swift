//
//  ChangeCountryFlagsViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 13/01/24.
//

import UIKit


protocol updateInterface {
    
    func updateInterface(data: FlagData?)
}

class ChangeCountryFlagsViewController: UIViewController {
    
    var delegate: updateInterface?
    
    private let searchController = UISearchController()
    private let tableView: UITableView = {
       
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(FlagCell.self, forCellReuseIdentifier: FlagCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var allFlagDatas = [
    
        FlagData(flagImageName: "uzb", flagName: "O'zbekistan", codeCountry: "(+998)"),
        FlagData(flagImageName: "rus", flagName: "Rossiya", codeCountry: "(+667)"),
        FlagData(flagImageName: "eng", flagName: "Amerika", codeCountry: "(+1)"),
        FlagData(flagImageName: "argentina", flagName: "Argentina", codeCountry: "(+54)"),
        FlagData(flagImageName: "brunei", flagName: "Brunei", codeCountry: "(+673)"),
        FlagData(flagImageName: "dominica", flagName: "Dominica", codeCountry: "(+676)"),
        FlagData(flagImageName: "ecuador", flagName: "Ecuador", codeCountry: "(+132)"),
        FlagData(flagImageName: "finland", flagName: "Finland", codeCountry: "(+56)"),
        FlagData(flagImageName: "kenya", flagName: "Kenya", codeCountry: "(+93)"),
        FlagData(flagImageName: "greece", flagName: "Greece", codeCountry: "(+231)"),

    ]
    
    private lazy var resultFlags: [FlagData] = allFlagDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setNavigationBarItems()
        setUpSearchBarController()
        setUpTableView()
    }
}

//MARK: setUp searchBar

extension ChangeCountryFlagsViewController: UISearchResultsUpdating {

    private func setUpSearchBarController() {
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }

    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        if text?.count == 0 || text == nil {
            resultFlags = allFlagDatas
            tableView.reloadData()
            return
        }
        resultFlags = []
        for item in allFlagDatas {
            
            if item.flagName.lowercased().contains((text?.lowercased())!) {
                resultFlags.append(item)
            }
        }
        tableView.reloadData()
    }
}


//MARK: setUp navigation

extension ChangeCountryFlagsViewController {
    
    private func setNavigationBarItems() {
        
        title = "Mamlakatni tanlang"
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .done,
            target: self,
            action: #selector(goBack))
        backButton.tintColor = .darkGray
        navigationItem.leftBarButtonItem = backButton
    }
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: setUp tableView and delegates

extension ChangeCountryFlagsViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setUpTableView() {
            
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.leftAnchor(view.leftAnchor, 0)
        tableView.rightAnchor(view.rightAnchor, 0)
        tableView.bottomAnchor(view.bottomAnchor, 0)
        tableView.topAnchor(view.topAnchor, 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultFlags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlagCell.identifier, for: indexPath) as! FlagCell
        cell.setDataToCell(data: resultFlags[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = resultFlags[indexPath.row]
        delegate?.updateInterface(data: data)
        navigationController?.popViewController(animated: true)
    }
}
