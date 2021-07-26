//
//  OpeningHours.swift
//  Desafio
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 21/07/21.
//

import Foundation

// MARK: - OpeningHours
struct OpeningHours: Codable {
    let openNow: Bool

    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
}
