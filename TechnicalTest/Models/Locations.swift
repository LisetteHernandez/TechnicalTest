//
//  Locations.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import Foundation

import Foundation

struct Location: Codable, Identifiable {
    let id = UUID()
    let status: String
    let country: String
    let countryCode: String
    let region: String
    let regionName: String
    let city: String
    let zip: String
    let lat: Double
    let lon: Double
    let timezone: String
    let isp: String
    let org: String
    let query: String
}

