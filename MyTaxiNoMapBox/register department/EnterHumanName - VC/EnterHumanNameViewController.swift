//
//  EnterHumanNameViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 15/01/24.
//

import UIKit

class EnterHumanNameViewController: UIViewController {

    var number: String = ""
    
    private let enterNameLabel = UILabel(
        text: "Ismingizni kiriting",
        textAlignment: .center,
        font: .systemFont(ofSize: 33, weight: .semibold)
    )
    
    private let needEnterNameLabel = UILabel(
        text: "Ro'yxatdan o'tish uchun ismingizni kiriting",
        textColor: .gray,
        textAlignment: .center,
        font: .systemFont(ofSize: 14, weight: .regular)
    )
    
    private let textView: UITextView = {
        
        let textField = UITextView()
        textField.backgroundColor = .clear
        textField.font = .systemFont(ofSize: 44, weight: .semibold)
        textField.textAlignment = .center
        
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return textField
    }()
    
    private let nextButton = UIButton(title: "Maydonni to'ldiring", backColor: .systemGray5)
    private lazy var bottomBtnConstraint = nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
    
    private lazy var topStackView: UIStackView = {
        
        let topStackView = UIStackView(
            arrangedSubviews: [enterNameLabel, needEnterNameLabel, textView],
            axis: .vertical,
            spacing: 10
        )
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        return topStackView
    }()
    
    private var enteredName: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUIElements()
        setSettingsToNavBar()
        setKeyboardSettings()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.textView.becomeFirstResponder()
        }
        
    }    
}

// MARK: set settings to navigationBar

extension EnterHumanNameViewController {
    
    private func setSettingsToNavBar() {
        
        navigationItem.setHidesBackButton(true, animated: true)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Tozalash",
            style: .done,
            target: self,
            action: #selector(clearNameTextField)
        )
        
        if textView.text == "" {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    @objc func clearNameTextField() {
        textView.text = ""
        enteredName = false
        navigationItem.rightBarButtonItem?.isEnabled = false
        nextButton.setTitle("Maydonni to'ldiring", for: .normal)
        nextButton.backgroundColor = .systemGray5

    }
}

// MARK: set UI elements

extension EnterHumanNameViewController {
    
    private func setUIElements() {
        
        view.addSubview(nextButton)
        view.addSubview(topStackView)
        textView.delegate = self
        
        topStackView.leftAnchor(view.leftAnchor, 20)
        topStackView.rightAnchor(view.rightAnchor, -20)
        topStackView.topAnchor(view.safeAreaLayoutGuide.topAnchor, 20)
            
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.leftAnchor(view.leftAnchor, 20)
        nextButton.rightAnchor(view.rightAnchor, -20)
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bottomBtnConstraint.isActive = true
        
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }
    
    @objc func nextTapped() {
        
        let accountData = AccountVCData(name: textView.text, number: number)
        
        UserDefaultsManager.shared.saveAccoundDataOneTime(data: accountData)
        let  mapVC = MapHomeViewController()
        pushVC(with: mapVC)
    }
}

// MARK: textView delegates

extension EnterHumanNameViewController : UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        guard let text = textView.text, text != ""
        else {
            navigationItem.rightBarButtonItem?.isEnabled = false
            nextButton.setTitle("Maydonni to'ldiring", for: .normal)
            nextButton.backgroundColor = .systemGray5
            enteredName = false
            return
        }
        
        navigationItem.rightBarButtonItem?.isEnabled = true
        nextButton.setTitle("Keyingisi", for: .normal)
        nextButton.backgroundColor = .systemYellow
        enteredName = true
    }
}

// MARK: keyboard settings

extension EnterHumanNameViewController {
    
    private func setKeyboardSettings() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification: )),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(notification: )),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else { return }
        
        let heightKeyboard = keyboardFrame.cgRectValue.height
        
        bottomBtnConstraint.constant =  -heightKeyboard - 20
        bottomBtnConstraint.isActive = true
        nextButton.updateConstraints()
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(notification: Notification) {
                
        bottomBtnConstraint.constant = -40
        bottomBtnConstraint.isActive = true
        nextButton.updateConstraints()
        self.view.layoutIfNeeded()
    }
}
