//
//  AccountViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 24/01/24.
//

import UIKit

class AccountViewController: UIViewController {
    
    private var accountView = AccountView()
    private var accountData = UserDefaultsManager.shared.getAccoundData()
    
    override func loadView() {
        self.view = accountView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shaxsiy sahifa"
        
        setDelegates()
        setNavigationBtns()
        setUpBackButton()
        setAnyTargetFunc()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.accountData = UserDefaultsManager.shared.getAccoundData()
        self.accountView.tableView.reloadData()
        
        self.accountView.accoundHeaderView.updateHeaderElements()
    }
    
    private func setDelegates() {
        
        accountView.tableView.delegate = self
        accountView.tableView.dataSource = self
    }
    
    @objc func editButtonTapped() {
        let accountAlertVC = AccoundAlertViewController()
        accountAlertVC.AccoundVC = self
        accountAlertVC.modalPresentationStyle = .overFullScreen
        present(accountAlertVC, animated: true)
    }
        
    private func setAnyTargetFunc() {
        
        guard let changeAccoundImageBtn = view.viewWithTag(AccoundTableHeaderViewTags.changeImageAccoundBtn.rawValue) as? UIButton else { return }
        changeAccoundImageBtn.addTarget(self, action: #selector(showImagePickerVC), for: .touchUpInside)
    }
    
    @objc func showImagePickerVC() { presentImagePickerVC() }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { numberOfSections() }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberRowsInSection(numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AccoundTableViewCell.identifier,
                                                     for: indexPath) as! AccoundTableViewCell
            cell.formTitleCell(indexPath: indexPath)
            
            if let accountData = accountData {
                cell.setDataToCell(data: accountData, indexPath: indexPath)
            }
            cell.selectionStyle = .none
            return cell
        }
        
        cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Profilni o'chirish"
        cell.textLabel?.textColor = .red
        cell.textLabel?.textAlignment = .center
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 20 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       didSelectRow(indexPath: indexPath)
        
    }
}
