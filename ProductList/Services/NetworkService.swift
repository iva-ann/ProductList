//
//  NetworkService.swift
//  ProductList
//
//  Created by Анна Иванова on 28.08.2023.
//

import Foundation

protocol NetworkServiceProtocol {}

final class NetworkService: NetworkServiceProtocol {
    
    static var shared = NetworkService()
    private let urlSession: URLSession = URLSession.shared
    private let url = URL(string: "https://www.avito.st/s/interns-ios/main-page.json")
    
    func fetchProducList(completionHandler: @escaping (Result<BackendProductModels?, Error>) -> Void) {
        guard let url = URL(string: "https://www.avito.st/s/interns-ios/main-page.json") else { return }
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
    
}
