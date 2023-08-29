//
//  ProductListScreenPresenter.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import Foundation

final class ProductListScreenPresenter {
    
    private var router: MainRouterProtocol?
    private weak var view: ProductListScreenPresenterOutput?
    private let networkService: NetworkServiceProtocol = NetworkService.shared
    
    private var productModels: [ProductBackendModel] = []
    
    init(router: MainRouterProtocol?,
         view: ProductListScreenPresenterOutput?) {
        self.router = router
        self.view = view
    }
    
    private func displayProductListInfo(_ productListModel: BackendProductModels) {
        let productModels = productListModel.advertisements.map({ $0 })
        self.productModels = productModels
        print(productModels)
//       передать вью
    }
}

extension ProductListScreenPresenter: ProductListScreenPresenterInput {
    func getProductListInfo() {
        NetworkService.shared.fetchProducList { [weak self] result in
            switch result {
            case .success(let productModels):
                if let productModels = productModels {
                self?.displayProductListInfo(productModels)
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
