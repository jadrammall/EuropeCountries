//
//  CountryResponse.swift
//  EuropeCountries
//
//  Created by Jad Rammal on 28/10/2024.
//

import Foundation

struct CountryResult: Codable {
    var name: CountryName
    var capital: [String]
    var flags: CountryFlag
    var maps: CountryMap
}

struct CountryName: Codable {
    var common: String
}

struct CountryFlag: Codable {
    var png: String
}

struct CountryMap: Codable {
    var googleMaps: String
}
