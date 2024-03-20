//
//  AddPlasticCardVC.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 09/02/24.
//

import UIKit

class AddPlasticCardVC: UIViewController {

    private let mainView = AddPlasticCardVCHomeView()
    private var presenter: AddPlasticCardVCPresentable
    private var readyCardInformation: Bool = false
    
    init() {
        self.presenter = AddPlasticCardVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        title = "Kartani qo'shish"
        setUpBackButton()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setTargetFunctions()
    }
    
    private func setDelegates() {
        self.mainView.cardNumberTextField.delegate = self
        self.mainView.lifeTimeTextField.delegate = self
    }
    
    private func setTargetFunctions() {
        
        self.mainView.addCardButton.addTarget(self, action: #selector(addCardButtonTapped), for: .touchUpInside)
        self.mainView.scannerButton.addTarget(self, action: #selector(scanerBtnTapped), for: .touchUpInside)
        
    }
    
    @objc func addCardButtonTapped() {
        
        if readyCardInformation {
            presenter.addCardTapped()
        }
        popVC()
    }
    
    @objc func scanerBtnTapped() {
        
    }
}

extension AddPlasticCardVC: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)

        return (textField.tag == CardProperties.plasticCardNum.rawValue) ?
        (newText.count <= 19) : (newText.count <= 5)
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
                
        presenter.textFieldDidChangeSelection(textField)
        readyCardInformation = presenter.readyCardInformation()
    }
}
