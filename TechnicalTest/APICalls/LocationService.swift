//
//  LocationService.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import Foundation
import Combine

class LocationService: ObservableObject {
    @Published var locations: [Location] = []
    
    func fetchLocation() {
        guard let url = URL(string: "http://ip-api.com/json/24.48.0.1") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let data = data {
                guard let location = try? JSONDecoder().decode(Location.self, from: data) else { return }
                DispatchQueue.main.async {
                    self?.locations = [location] // La API devuelve un solo resultado, lo convertimos en un arreglo
                }
            }
        }.resume()
    }
}

