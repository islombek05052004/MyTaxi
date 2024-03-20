//
//  AccountViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 24/01/24.
//

import UIKit

class AccountViewController: UIViewController {
    
    private var accountView = AccountVCHomeView()
    private var accountData = UserDefaultsManager.shared.getAccoundData()
    private var presenter: AccoundVCPresentable
    
    init() {
        self.presenter = AccoundVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = accountView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = accountView
        setNavigationBtns()
        title = "Shaxsiy sahifa"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
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
        accountAlertVC.modalPresentationStyle = .pageSheet
        
        if #available(iOS 15, *), let sheet = accountAlertVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(accountAlertVC, animated: true)
    }
        
    @objc func accountImageTapped() { self.presenter.accountImageTapped() }
    
    private func setNavigationBtns() {
        
        setUpBackButton()
        
        let editButton = UIBarButtonItem(
            title: "Tahrirlash",
            style: .done,
            target: self,
            action: #selector(editButtonTapped)
        )
        navigationItem.rightBarButtonItem = editButton
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { presenter.numberOfSections() }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberRowsInSection(numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AccoundTableViewCell.identifier, for: indexPath) as! AccoundTableViewCell
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(indexPath: indexPath)
    }
}

extension AccountViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
    
        if let image = info[.editedImage] as? UIImage {
            dismiss(animated: true)
            UserDefaultsManager.shared.saveAccountImage(image: image)
        }
    }
}

