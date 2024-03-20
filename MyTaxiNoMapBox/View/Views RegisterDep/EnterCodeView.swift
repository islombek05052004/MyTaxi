//
//  EnterCodeView.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 14/01/24.
//

import UIKit
//
//class EnterCodeView: UIView {
//
//    var code: String?
//    private var codeNumLabelArr = [(UILabel, UIView)]()
//
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//
//        var finalStackView = UIStackView(arrangedSubviews: [], axis: .horizontal, spacing: 20)
//
//
//        for _ in 0...3 {
//
//            let codeNumLabel = UILabel(text: "0", textColor: .gray, textAlignment: .center, backColor: .gray)
//            let bottomLineView = UIView()
//
//            codeNumLabel.translatesAutoresizingMaskIntoConstraints = false
//            bottomLineView.translatesAutoresizingMaskIntoConstraints = false
//
//            let stackView = UIStackView(
//                arrangedSubviews: [codeNumLabel, bottomLineView],
//                axis: .vertical,
//                spacing: 10
//            )
//
//            codeNumLabel.widhtHeight(40, 60)
//            codeNumLabel.layer.cornerRadius = 7
//
//            bottomLineView.heightAnchor.constraint(equalToConstant: 4).isActive = true
//            bottomLineView.layer.cornerRadius = 2
//            bottomLineView.backgroundColor = .gray
//
//            codeNumLabelArr.append((codeNumLabel, bottomLineView))
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setTextToCodeView(text: String?) {
//
//        guard let text = text else { return }
//
//        let textCount = text.count
//
//        for index in 0..<codeNumLabelArr.count {
//
//            if index <= textCount {
//
//            }
//
//        }
//
//    }
//
//
//
//}
