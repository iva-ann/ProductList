//
//  ErrorView.swift
//  ProductList
//
//  Created by Анна Иванова on 31.08.2023.
//

import UIKit

final class ErrorView: UIView {
    
    private let errorLabel: UILabel = UILabel()
    private let updateButton: UIButton = UIButton()
    private let stackView: UIStackView = UIStackView()
    
    var tappedButtonCompletion: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initialSetup() {
        errorLabel.setupWith(size: 15, weight: .semibold, textColor: .darkGray, textAlignment: .center)
        errorLabel.text = "Ошибка загрузки данных"
        errorLabel.sizeToFit()
        
        updateButton.setTitle("Обновить", for: .normal)
        updateButton.setTitleColor(.blue, for: .normal)
        updateButton.addTarget(self,
                               action: #selector(updateButtonTapped),
                               for: .touchUpInside)
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubviews([
            errorLabel,
            updateButton
        ])
        addSubview(stackView)
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
    }
    
    @objc
    private func updateButtonTapped() {
        tappedButtonCompletion?()
    }
}
