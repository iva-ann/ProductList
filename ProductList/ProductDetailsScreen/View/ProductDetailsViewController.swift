//
//  ProductDetailsViewController.swift
//  ProductList
//
//  Created by Анна Иванова on 31.08.2023.
//

import UIKit

final class ProductDetailsViewController: UIViewController {
    enum Constants {
        static let nameTextSize: CGFloat = 22
        static let priceTextSize: CGFloat = 40
        static let adressTextSize: CGFloat = 18
        static let infoTextSize: CGFloat = 18
    }
    
    private let productImageView: UIImageView = .init()
    private let prodactNameLabel: UILabel = .init()
    private let productPriceLabel: UILabel = .init()
    
    private let productAddressLabel: UILabel = .init()
    private let productLocationLabel: UILabel = .init()
    private let productCreatedDateLabel: UILabel = .init()
    private let productDescriptionLabel: UILabel = .init()
    
    private let productPhoneLabel: UILabel = .init()
    private let productEmailLabel: UILabel = .init()
    
    private let mainStackView: UIStackView = .init()
    private let headerStackView: UIStackView = .init()
    private let addressStackView: UIStackView = .init()
    private let contactsStackView: UIStackView = .init()
    
    var presenter: ProductDetailsPresenterProtocolInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
        makeConstraints()
    }
    
    private func initialSetup() {
        self.view.backgroundColor = .white
    }
    
    private func setupViews() {
        setupStackViews()
        setupLabels()
        
        productImageView.backgroundColor = .green
        prodactNameLabel.text = "prodactNameLabel"
        productPriceLabel.text = "productPriceLabel"
        productLocationLabel.text = "productLocationLabel"
        productAddressLabel.text = "productAddressLabel"
        productDescriptionLabel.text = "productDescriptionLabel"
        productPhoneLabel.text = "productPhoneLabel"
        productEmailLabel.text = "productEmailLabel"
        productCreatedDateLabel.text = "productCreatedDateLabel"
        
        mainStackView.addArrangedSubviews([
            //            productImageView,
            headerStackView,
            addressStackView,
            productDescriptionLabel,
            contactsStackView
        ])
        
        self.view.addSubview(productImageView)
        self.view.addSubview(mainStackView)
    }
    
    private func setupStackViews() {
        mainStackView.alignment = .fill
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 15
        
        headerStackView.axis = .vertical
        headerStackView.alignment = .fill
        headerStackView.distribution = .equalSpacing
        headerStackView.spacing = 5
        headerStackView.addArrangedSubviews([
            productPriceLabel,
            prodactNameLabel,
            productCreatedDateLabel,
        ])
        
        addressStackView.axis = .vertical
        addressStackView.alignment = .fill
        addressStackView.addArrangedSubviews([
            productAddressLabel,
            productLocationLabel,
        ])
        
        contactsStackView.axis = .vertical
        contactsStackView.alignment = .fill
        contactsStackView.addArrangedSubviews([
            productPhoneLabel,
            productEmailLabel
        ])
        
    }
    
    private func setupLabels() {
        prodactNameLabel.setupWith(size: Constants.nameTextSize, weight: .bold, textColor: .black, textAlignment: .left)
        productPriceLabel.setupWith(size: Constants.priceTextSize, weight: .semibold, textColor: .black, textAlignment: .left)
        productLocationLabel.setupWith(size: Constants.adressTextSize, weight: .regular, textColor: .darkGray, textAlignment: .left)
        productAddressLabel.setupWith(size: Constants.adressTextSize, weight: .regular, textColor: .darkGray, textAlignment: .left)
        
        
        productDescriptionLabel.setupWith(size: Constants.infoTextSize, weight: .regular, textColor: .darkGray, textAlignment: .left)
        productPhoneLabel.setupWith(size: Constants.infoTextSize, weight: .regular, textColor: .darkGray, textAlignment: .left)
        productEmailLabel.setupWith(size: Constants.infoTextSize, weight: .regular, textColor: .darkGray, textAlignment: .left)
        productCreatedDateLabel.setupWith(size: Constants.infoTextSize, weight: .regular, textColor: .darkGray, textAlignment: .left)
    }
    
    private func makeConstraints() {
        productImageView.snp.makeConstraints {
            $0.width.equalTo(self.view.frame.width)
            $0.height.equalTo(self.view.frame.height / 2.2)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(15)
            $0.left.right.equalToSuperview().offset(15)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-25)
        }
    }
}

extension ProductDetailsViewController: ProductDetailsPresenterProtocolOutput {}
