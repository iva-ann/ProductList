//
//  NetworkService.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import Foundation

enum RequestType {
    case mainPage
    case productDetails(String)
}

protocol NetworkServiceProtocol {}

final class NetworkService: NetworkServiceProtocol {
    
    enum URLComponents {
        static let start = "https://www.avito.st/s/interns-ios/"
        static let end = ".json"
        
        static let mainPage = "main-page"
        static let productDetails = "details/"
    }
    
    static var shared = NetworkService()
    private let urlSession: URLSession = URLSession.shared
    //    private let productListUrl = URL(string: "https://www.avito.st/s/interns-ios/main-page.json")
    
    private let endUrlComponent: String = ".json"
    
    func fetchProducList(completionHandler: @escaping (Result<BackendProductModels?, Error>) -> Void) {
        guard let url = getURL(for: .mainPage) else { return }
        urlSession.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let error = error {
                print("error: \(error)")
            }
            do {
                let jsonResult = try JSONDecoder().decode(BackendProductModels.self, from: data)
                completionHandler(.success(jsonResult))
            } catch {
                let error = error
                print("error: \(error)")
                completionHandler(.failure(error))
            }
        }.resume()
    }
    
    func fetchProductDetails(by productId: String, completionHandler: @escaping (Result<ProductBackendModel?, Error>) -> Void) {
        guard let url = getURL(for: .productDetails(productId)) else { return }
        urlSession.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let error = error {
                print("error: \(error)")
            }
            do {
                let jsonResult = try JSONDecoder().decode(ProductBackendModel.self, from: data)
                completionHandler(.success(jsonResult))
            } catch {
                let error = error
                print("error: \(error)")
                completionHandler(.failure(error))
            }
        }.resume()
    }
    
    
    private func getURL(for type: RequestType) -> URL? {
        switch type {
        case .mainPage:
            let urlString = URLComponents.start + URLComponents.mainPage + URLComponents.end
            return URL(string: urlString)
        case .productDetails(let id):
            let urlString = URLComponents.start + URLComponents.productDetails + id + URLComponents.end
            return URL(string: urlString)
        }
    }
}
