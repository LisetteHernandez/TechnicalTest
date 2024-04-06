//
//  Product.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
}
