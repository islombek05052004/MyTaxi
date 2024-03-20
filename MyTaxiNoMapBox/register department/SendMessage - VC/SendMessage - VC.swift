//
//  SendMessageViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 13/01/24.
//

import UIKit

class SendMessageViewController: UIViewController {

    private let sendButton = UIButton(
        title: "Maydonni to'ldiring",
        backColor: .systemGray5,
        font: .systemFont(ofSize: 20, weight: .semibold)
    )
    
    private let conditionsLabel: UITextView = {
        let attributedString = NSMutableAttributedString(string: "Keyingi tugmasini bosish orqali men foydalanuvchi shartlarini qabul qilaman")
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 36, length: 25))

        let conditionsLabel = UITextView()
        conditionsLabel.attributedText = attributedString
        conditionsLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionsLabel.textAlignment = .center
        conditionsLabel.textColor = .gray
        conditionsLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        conditionsLabel.isUserInteractionEnabled = false
        conditionsLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return conditionsLabel
    }()
    
    private let enterNumber = UILabel(
        text: "Raqamni kiriting",
        textAlignment: .center,
        font: .systemFont(ofSize: 33, weight: .semibold)
    )
    
    private let sendMessageLabel = UILabel(
        text: "Raqamni tasdiqlash kodi yuboriladi",
        textColor: .gray,
        textAlignment: .center,
        font: .systemFont(ofSize: 16, weight: .semibold)
    )
    
    private let flagImageView = UIImageView(
        image: UIImage(named: "uzb"),
        contentMode: .scaleAspectFit
    )
    
    let bottomStackView = UIStackView(
        arrangedSubviews: [],
        axis: .vertical,
        spacing: 10
    )
    
    private let selectFlagButton = UIButton()
    
    private let countryCodeLabel = UILabel(text: "+998", font: .systemFont(ofSize: 18, weight: .semibold))
    
    private let numTextField: UITextField = {
       
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.keyboardType = .phonePad
        textField.font = .systemFont(ofSize: 18, weight: .semibold)
        textField.placeholder = "(00) 000-00-00"
        return textField
    }()
    private var havePhoneNumber = false
    
    private lazy var changeOriginYBottomStack = bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
                
        setUpBackButton()
        setBottomStackView()
        setTopStackView()
        setKeyboardSettings()
        setTargets()
                
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: set targets

extension SendMessageViewController {
    
    private func setTargets() {
        selectFlagButton.addTarget(self, action: #selector(selectFlagBtnTapped), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
    }
    
    @objc func selectFlagBtnTapped(){
        
        let changeFlagsVC = ChangeCountryFlagsViewController()
        changeFlagsVC.delegate = self
        navigationController?.pushViewController(changeFlagsVC, animated: true)
    }
    
    @objc func sendTapped() {
        
        if havePhoneNumber {
            let checkCodeVC = CheckCodeViewController()
            checkCodeVC.number = numTextField.text!
            navigationController?.pushViewController(checkCodeVC, animated: true)
        }
    }
}

// MARK: update code country

extension SendMessageViewController: updateInterface {
    func updateInterface(data: FlagData?) {
        if let data = data {
            
            DispatchQueue.main.async {
                self.flagImageView.image = UIImage(named: data.flagImageName)
                self.countryCodeLabel.text = data.codeCountry
            }
        }
    }
}

// MARK: set keyboard notification

extension SendMessageViewController {
    
    private func setKeyboardSettings() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showTime(notification: )),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(hideTime(notification: )),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc func showTime(notification: NSNotification) {
        
        guard let keyboardRect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight = keyboardRect.cgRectValue.height
        
        changeOriginYBottomStack.constant = -keyboardHeight - 20
        changeOriginYBottomStack.isActive = true
//        bottomStackView.updateConstraints()
        self.view.layoutIfNeeded()
    }
    
    @objc func hideTime(notification: NSNotification) {
        
        changeOriginYBottomStack.constant = -30
        changeOriginYBottomStack.isActive = true
        self.view.layoutIfNeeded()
    }
}

// MARK: set UI elements

extension SendMessageViewController {
    
    private func setBottomStackView() {
        
        bottomStackView.addArrangedSubview(conditionsLabel)
        bottomStackView.addArrangedSubview(sendButton)
        view.addSubview(bottomStackView)
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        sendButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        changeOriginYBottomStack.isActive = true
        bottomStackView.leftAnchor(view.leftAnchor, 20)
        bottomStackView.rightAnchor(view.rightAnchor, -20)
    }
    
    private func setTopStackView() {
        
        let customNumTextFieldView = EnterNumTextFieldView(
            imageView: flagImageView,
            buttonFlag: selectFlagButton,
            codeCountyLabel: countryCodeLabel,
            textField: numTextField
        )
        numTextField.delegate = self
        
        let topStackView = UIStackView(
            arrangedSubviews: [enterNumber, sendMessageLabel, customNumTextFieldView],
            axis: .vertical,
            spacing: 20
        )
        sendMessageLabel.numberOfLines = 0
        
        view.addSubview(topStackView)
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        
        topStackView.topAnchor(view.safeAreaLayoutGuide.topAnchor, 16)
        topStackView.leftAnchor(view.leftAnchor, 16)
        topStackView.rightAnchor(view.rightAnchor, -20)
    }
}

// MARK: TextField Delegates

extension SendMessageViewController: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {

        if let text = textField.text, text != "" {
            sendButton.setTitle("Keyingi", for: .normal)
            sendButton.backgroundColor = .systemYellow
            havePhoneNumber = true
            return
        }

        havePhoneNumber = false
        sendButton.setTitle("Maydonni to'ldiring", for: .normal)
        sendButton.backgroundColor = .systemGray5
    }

//    private func setPhoneTextType(text: String? ) -> String {
//
//        guard let text = text else { return "" }
//
//        var returnText: String = ""
//
//        switch text.count {
//        case 1...3: returnText = "(\(text.dropFirst(2))"
//        case 4: returnText = "(\(text))"
//        default: returnText = "()"
//        }
//
//        return returnText
//    }
}
