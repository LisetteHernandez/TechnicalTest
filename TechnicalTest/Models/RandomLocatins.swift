//
//  RandomLocatins.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import Foundation

struct RandomLocation: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: (Double, Double) {
        return (latitude, longitude)
    }
    
    static func generateRandomLocations(count: Int) -> [RandomLocation] {
        (0..<count).map { _ in
            RandomLocation(
                latitude: Double.random(in: 24.396308...49.384358),
                longitude: Double.random(in: -125.0...(-66.93457)) // Removed the extra dot before -125.0
            )
        }
    }




}
