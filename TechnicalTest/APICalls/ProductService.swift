//
//  ProductService.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import Foundation
import Combine

class ProductService: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        fetchProducts()
    }

    func fetchProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            if let products = try? JSONDecoder().decode([Product].self, from: data) {
                DispatchQueue.main.async {
                    self?.products = products
                }
            }
        }.resume()
    }
}

