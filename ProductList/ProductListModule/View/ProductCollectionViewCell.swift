//
//  ProductCollectionViewCell.swift
//  ProductList
//
//  Created by Анна Иванова on 29.08.2023.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    enum Constants {
        static let titleTextSize: CGFloat = 20
        static let subtitleTextSize: CGFloat = 10
    }
    private let productImageView: UIImageView = .init()
    private let prodactNameLabel: UILabel = .init()
    private let productPriceLabel: UILabel = .init()
    private let productLocationLabel: UILabel = .init()
    private let productCreatedDateLabel: UILabel = .init()
    private let stackView: UIStackView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        setupLabels()
        setupstackView()
        
        stackView.addArrangedSubviews([
        productImageView,
        prodactNameLabel,
        productPriceLabel,
        productLocationLabel,
        productCreatedDateLabel
        ])
        
        self.addSubview(stackView)
    }
    
    private func setupLabels() {
        prodactNameLabel.setupWith(size: Constants.titleTextSize, weight: .regular, textColor: .black, textAlignment: .left)
        productPriceLabel.setupWith(size: Constants.titleTextSize, weight: .medium, textColor: .black, textAlignment: .left)
        productLocationLabel.setupWith(size: Constants.subtitleTextSize, weight: .regular, textColor: .lightGray, textAlignment: .left)
        productCreatedDateLabel.setupWith(size: Constants.subtitleTextSize, weight: .regular, textColor: .lightGray, textAlignment: .left)
        
        prodactNameLabel.text = "Name"
        productPriceLabel.text = "productPriceLabel"
        productLocationLabel.text = "productLocationLabel"
        productCreatedDateLabel.text = "productCreatedDateLabel"
    }
    
    private func setupstackView() {
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
    }
    
    private func makeConstraints() {
        
        productImageView.snp.makeConstraints {
            $0.width.height.equalTo(self.snp.width)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
    }
}
