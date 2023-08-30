//
//  ProductListScreenViewController.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import UIKit
import SnapKit

final class ProductListScreenViewController: UIViewController {
    enum Constants {
        static let horizontalSectionInset: CGFloat = 10
    }
    
    // MARK: - Private properties
    private var presenter: ProductListScreenPresenterInput?
    private var collectionView: UICollectionView
    private let titleLabel: UILabel = UILabel()
    private lazy var mainStackView: UIStackView = UIStackView()
    
    // MARK: - Initialization
    
    init() {
        collectionView = UICollectionView(frame: CGRect.zero,
                                          collectionViewLayout: UICollectionViewFlowLayout.init())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
        makeConstraints()
    }
    
    // MARK: - Private methods
    private func initialSetup() {
        self.view.backgroundColor = .white
        presenter?.getProductListInfo()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(ProductCollectionViewCell.self,
                                forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func setupViews() {
        setupStackView()
        setupLabel()
        
        mainStackView.addArrangedSubviews([
            titleLabel,
            collectionView
        ])
        self.view.addSubview(mainStackView)
    }
    
    private func setupStackView() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
    }
    
    private func setupLabel() {
        titleLabel.text = "Список продуктов"
        titleLabel.setupWith(size: 20,
                             weight: .medium,
                             textColor: .black,
                             textAlignment: .center)
    }
    
    private func makeConstraints() {
        mainStackView.setCustomSpacing(20, after: titleLabel)
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}

// MARK: - Extension UICollectionViewDataSource
extension ProductListScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.getProductsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath)
        guard let productCell = cell as? ProductCollectionViewCell else { return cell}
        return productCell
    }
}
// MARK: - Extension UICollectionViewDelegate
extension ProductListScreenViewController: UICollectionViewDelegate {
    
}

extension ProductListScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        flowayout?.sectionInset.right = Constants.horizontalSectionInset
        flowayout?.sectionInset.left = Constants.horizontalSectionInset

        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size: CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size * 1.5)
    }
}

// MARK: - Extension ProductListScreenPresenterOutput
extension ProductListScreenViewController: ProductListScreenPresenterOutput {
    func setUpPresenter(_ presenter: ProductListScreenPresenterInput) {
        self.presenter = presenter
    }
    
    func reloadProductList() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
