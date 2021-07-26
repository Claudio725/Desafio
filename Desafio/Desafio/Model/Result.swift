//
//  Result.swift
//  Desafio
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 21/07/21.
//

import Foundation

// MARK: - Result
struct Result: Codable {
    let businessStatus: BusinessStatus
    let geometry: Geometry
    let icon: String
    let name: String
    let openingHours: OpeningHours
    let photos: [Photo]
    let placeID: String
    let plusCode: PlusCode
    let priceLevel: Int
    let rating: Double
    let reference: String
    let scope: Scope
    let types: [String]
    let userRatingsTotal: Int
    let vicinity: String
    let permanentlyClosed: Bool

    enum CodingKeys: String, CodingKey {
        case businessStatus = "business_status"
        case geometry, icon, name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case plusCode = "plus_code"
        case priceLevel = "price_level"
        case rating, reference, scope, types
        case userRatingsTotal = "user_ratings_total"
        case vicinity
        case permanentlyClosed = "permanently_closed"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let _business = "CLOSED_TEMPORARILY"
        businessStatus = try values.decodeIfPresent(BusinessStatus.self, forKey: .businessStatus) ?? BusinessStatus(rawValue: _business)!
        geometry = try values.decodeIfPresent(Geometry.self, forKey: .geometry) ?? Geometry(location: Location.init(lat: 1, lng: 1), viewport: Viewport.init(northeast: Location.init(lat: 0.1, lng: 0.1), southwest: Location.init(lat: 0.1, lng: 0.1)))
        icon = try values.decodeIfPresent(String.self, forKey: .icon) ?? "xxx"
        name = try values.decodeIfPresent(String.self, forKey: .name    ) ?? "xxx"
        openingHours = try values.decodeIfPresent(OpeningHours.self, forKey: .openingHours) ?? OpeningHours(openNow: false)
        photos = try values.decodeIfPresent([Photo].self, forKey: .photos) ?? [Photo(height: 0, htmlAttributions: [""], photoReference: "", width: 0)]
        placeID = try values.decodeIfPresent(String.self, forKey: .placeID) ?? "xx"
        plusCode = try values.decodeIfPresent(PlusCode.self, forKey: .plusCode) ?? PlusCode(compoundCode: "xx", globalCode: "xx")
        priceLevel = try values.decodeIfPresent(Int.self, forKey: .priceLevel) ?? 0
        rating = try values.decodeIfPresent(Double.self, forKey: .rating) ?? 0.0
        reference = try values.decodeIfPresent(String.self, forKey: .reference) ?? "xx"
        let _scope = "GOOGLE"
        scope = try values.decodeIfPresent(Scope.self, forKey: .scope) ?? Scope(rawValue: _scope)!
        types = try values.decodeIfPresent([String].self, forKey: .types) ?? [""]
        userRatingsTotal = try values.decodeIfPresent(Int.self, forKey: .userRatingsTotal) ?? 0
        vicinity = try values.decodeIfPresent(String.self, forKey: .vicinity) ?? "xx"
        permanentlyClosed = try values.decodeIfPresent(Bool.self, forKey: .permanentlyClosed) ?? false
    }
}

enum Scope: String, Codable {
    case google = "GOOGLE"
}
