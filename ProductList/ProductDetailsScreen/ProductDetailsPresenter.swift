//
//  ProductDetailsPresenter.swift
//  ProductList
//
//  Created by Анна Иванова on 31.08.2023.
//

import Foundation

final class ProductDetailsPresenter {
    
    private var router: MainRouterProtocol?
    private weak var view: ProductDetailsPresenterProtocolOutput?
    private var productModel: ProductModel
    private let networkService: NetworkService = NetworkService()
    
    init(router: MainRouterProtocol?,
         productModel: ProductModel,
         view: ProductDetailsPresenterProtocolOutput?) {
        self.router = router
        self.productModel = productModel
        self.view = view
    }
    
    private func displayProdauctDetails(_ productBackendModel: ProductBackendModel) {
        updateProductModel(for: productBackendModel)
        view?.configure(with: productModel)
    }
    
    private func updateProductModel(for productBackendModel: ProductBackendModel)  {
        productModel.address = productBackendModel.address
        productModel.description = productBackendModel.description
        productModel.email = productBackendModel.email
        productModel.phoneNumber = productBackendModel.phoneNumber
    }
}

extension ProductDetailsPresenter: ProductDetailsPresenterProtocolInput {
    func getProductDetailsInfo() {
        NetworkService.shared.fetchProductDetails(by: productModel.id) { [weak self] result in
            switch result {
            case .success(let productModel):
                if let productModel = productModel {
                    self?.displayProdauctDetails(productModel)
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
