//
//  AutoComplete.swift
//  PleyHomeSearch
//
//  Created by Kinney Kare on 4/29/22.
//

import Foundation

//struct AutoCompleteResult: Codable {
//    let autocomplete: [Result]
//}
//
//struct Result: Codable {
//    let full_address: [FullAddress]
//}
//
//struct FullAddress: Codable {
//    let 0: String
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct AddressResult: Codable {
    let meta: Meta
    let autocomplete: [Autocomplete]
}

// MARK: - Autocomplete
struct Autocomplete: Codable {
    let areaType, id: String
    let score: Double
    let mprID: String?
    let fullAddress: [String]?
    let line: String?
    let city: String
    let postalCode: String?
    let stateCode, country: String
    let centroid: Centroid?
    let propStatus, validationCode: [String]?
    let counties: [County]?
    let slugID, geoID: String?
    let countyNeededForUniq: Bool?

    enum CodingKeys: String, CodingKey {
        case areaType = "area_type"
        case id = "_id"
        case score = "_score"
        case mprID = "mpr_id"
        case fullAddress = "full_address"
        case line, city
        case postalCode = "postal_code"
        case stateCode = "state_code"
        case country, centroid
        case propStatus = "prop_status"
        case validationCode = "validation_code"
        case counties
        case slugID = "slug_id"
        case geoID = "geo_id"
        case countyNeededForUniq = "county_needed_for_uniq"
    }
}

// MARK: - Centroid
struct Centroid: Codable {
    let lon, lat: Double
}

// MARK: - County
struct County: Codable {
    let name, fips, stateCode: String

    enum CodingKeys: String, CodingKey {
        case name, fips
        case stateCode = "state_code"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let build: String
}

