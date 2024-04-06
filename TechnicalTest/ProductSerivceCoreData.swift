//
//  ProductSerivceCoreData.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import Foundation

class ProductServiceCoreData: ObservableObject {
    @Published var products: [Product] = []
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchProductsFromCoreData()
        fetchProductsFromAPI()
    }

    private func fetchProductsFromCoreData() {
        let request: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        
        do {
            let productEntities = try context.fetch(request)
            self.products = productEntities.compactMap { entity in
                guard let title = entity.title else { return nil }
                return Product(id: Int(entity.id), title: title, price: entity.price)
            }
        } catch {
            print("Failed to fetch products from Core Data: \(error)")
        }
    }

    private func fetchProductsFromAPI() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            if let products = try? JSONDecoder().decode([Product].self, from: data) {
                DispatchQueue.main.async {
                    self.products = products
                    self.saveProductsToCoreData(products)
                }
            }
        }.resume()
    }

    private func saveProductsToCoreData(_ products: [Product]) {
        context.perform {
            for product in products {
                let productEntity = ProductEntity(context: self.context)
                productEntity.id = Int64(product.id)
                productEntity.title = product.title
                productEntity.price = product.price
            }
            
            do {
                try self.context.save()
            } catch {
                self.context.rollback()
                print("Failed to save products to Core Data: \(error)")
            }
        }
    }
}

