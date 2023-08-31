//
//  ProductListScreenPresenter.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import UIKit

final class ProductListScreenPresenter {
    
    private var router: MainRouterProtocol?
    private weak var view: ProductListScreenPresenterOutput?
    private let networkService: NetworkServiceProtocol = NetworkService.shared
    
    private var productModels: [ProductModel] = []
    
    init(router: MainRouterProtocol?,
         view: ProductListScreenPresenterOutput?) {
        self.router = router
        self.view = view
    }
    
    private func displayProductListInfo(_ productListModel: BackendProductModels) {
        let productModels = getProductModels(from: productListModel)
        self.productModels = productModels
        view?.reloadProductList()
    }
    
    private func getProductModels(from productListModel: BackendProductModels) -> [ProductModel] {
        let productBackendModels = productListModel.advertisements.map({ $0 })
        var productModels: [ProductModel] = []
        
        productBackendModels.forEach { model in
            guard let url = URL(string: model.imageURL) else { return }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    let productModel = ProductModel(id: model.id,
                                                    title: model.title,
                                                    price: model.price,
                                                    image: image,
                                                    location: model.location,
                                                    createdDate: model.createdDate)
                    productModels.append(productModel)
                }
            }
        }
        return productModels
    }
}

extension ProductListScreenPresenter: ProductListScreenPresenterInput {
    func getProductListInfo() {
        NetworkService.shared.fetchProducList() { [weak self] result in
            switch result {
            case .success(let productListModel):
                if let productListModel = productListModel {
                    self?.displayProductListInfo(productListModel)
                }
            case.failure(let error):
                print(error)
                self?.view?.displayErrorView()
            }
        }
    }
    
    func getProductsCount() -> Int {
        return productModels.count
    }
    
    func getProductModel(for index: Int) -> ProductModel {
        return productModels[index]
    }
    
    func didSelectProduct(at index: Int) {
        let selectedProduct = productModels[index]
        router?.openProducDetailsScreeen(for: selectedProduct)
    }
}
