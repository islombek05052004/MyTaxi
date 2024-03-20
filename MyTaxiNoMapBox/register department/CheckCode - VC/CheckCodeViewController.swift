//
//  CheckCodeViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 14/01/24.
//

import UIKit

class CheckCodeViewController: UIViewController {

    var number: String = ""
    
    private let enterCodeLabel = UILabel(
        text: "Kodni kiriting",
        textAlignment: .center,
        font: .systemFont(ofSize: 33, weight: .semibold)
    )
    
    private let sendMessageLabel = UILabel(
        text: "Tasdiqlash nomeri ushbu raqamga yuborildi",
        textColor: .gray,
        textAlignment: .center,
        font: .systemFont(ofSize: 14, weight: .regular)
    )
    
    private let sendNumberLabel = UILabel(
        text: "+998 (94) 013-25-05",
        textAlignment: .center,
        font: .systemFont(ofSize: 16, weight: .regular)
    )
    
    private let changeNumberButton = UIButton(
        title: "",
        backColor: .systemGray5,
        cornerRadius: 4
    )
    
    private lazy var sendNumberView: UIView = {

        let sendNumberView = UIView()
        sendNumberView.backgroundColor = .systemGray6
        sendNumberView.clipsToBounds = true
        sendNumberView.layer.cornerRadius = 10
        
        let stackView = UIStackView(
            arrangedSubviews: [sendNumberLabel, changeNumberButton],
            axis: .horizontal,
            spacing: 10
        )
        
        changeNumberButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        changeNumberButton.tintColor = .gray
        changeNumberButton.translatesAutoresizingMaskIntoConstraints = false
        changeNumberButton.widhtHeight(30, 30)
        
        sendNumberView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor(sendNumberView.leftAnchor, 10)
        stackView.rightAnchor(sendNumberView.rightAnchor, -10)
        stackView.topAnchor(sendNumberView.topAnchor, 5)
        stackView.bottomAnchor(sendNumberView.bottomAnchor, -5)
        
        return sendNumberView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUIElements()
        setTargets()
    }
}

//MARK: set targets

extension CheckCodeViewController {
    
    private func setTargets() {
        
        changeNumberButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
    }
    
    @objc func changeButtonTapped() {
        
        let enterHumanNameVC = EnterHumanNameViewController()
        enterHumanNameVC.number = number
        navigationController?.pushViewController(enterHumanNameVC, animated: true)
    }
}

// MARK: set ui elements

extension CheckCodeViewController {
    
    private func setUIElements() {
        
        let topStackView = UIStackView(
            arrangedSubviews: [enterCodeLabel, sendMessageLabel, sendNumberView],
            axis: .vertical,
            spacing: 10
        )
        topStackView.distribution = .equalSpacing
        topStackView.alignment = .center
        topStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(topStackView)
        
        topStackView.topAnchor(view.safeAreaLayoutGuide.topAnchor, 20)
        topStackView.leftAnchor(view.leftAnchor, 20)
        topStackView.rightAnchor(view.rightAnchor, -20)
    }
}

