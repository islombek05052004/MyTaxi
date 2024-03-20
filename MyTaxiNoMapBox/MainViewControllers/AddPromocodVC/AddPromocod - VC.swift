//
//  AddPromocod - VC.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

class AddPromocodViewController: UIViewController {
        
    private var presenter: AddPromocodVCPresentable
    private let mainView = AddPromocodVCHomeView()
    var enteredPromocod: Bool = false
    
    init() {
        self.presenter = AddPromocodVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboardFrames()
        setUpNavigationBtns()
        setDeletages()
        setTargetFunctions()
    }
    
    private func setDeletages() {
        self.mainView.promocodTF.delegate = self
    }
   
    private func setTargetFunctions() {
        self.mainView.addBtn.addTarget(self, action: #selector(addPromocodButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addPromocodButtonTapped() {
        
        if enteredPromocod == false { return }
        if let promokod = mainView.promocodTF.text { self.presenter.checkPromocod(promocod: promokod) }
    }
}

// MARK: Set Up Navigation Btns

extension AddPromocodViewController {
    
    private func setUpNavigationBtns() {
        
        setUpBackButton()
        setDeleteNavigationButton()
    }
    
    private func setDeleteNavigationButton() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "O'chirish",
            style: .done,
            target: self,
            action: #selector(deleteNavigationButtonTapped)
        )
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    @objc private func deleteNavigationButtonTapped() {
        self.mainView.promocodTF.text = ""
    }
}

// MARK: TextField delegate

extension AddPromocodViewController: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.presenter.textFieldDidChangeSelection(textField)
    }
}

// MARK: set Keyboard frames to bottom btn

extension AddPromocodViewController {
    
    private func setKeyboardFrames() {
        showKeyboard()
        hideKeyboard()
    }
    
    private func showKeyboard() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didShowKeyboard(responder: )),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }
    
    private func hideKeyboard() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didHideKeyboard(responder: )),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func didShowKeyboard(responder: NSNotification) {
        
        guard let keyboardRectangle = responder.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardRectangle.cgRectValue.height
        self.mainView.addBtn.frame.origin.y = Paddings.deviceBounds.height - (80 + keyboardHeight)
    }
    
    @objc private func didHideKeyboard(responder: NSNotification) {
        self.mainView.addBtn.frame.origin.y = Paddings.deviceBounds.height - 100
    }
}
