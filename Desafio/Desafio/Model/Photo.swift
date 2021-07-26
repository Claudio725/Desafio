//
//  Photo.swift
//  Desafio
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 21/07/21.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    let height: Int
    let htmlAttributions: [String]
    let photoReference: String
    let width: Int

    enum CodingKeys: String, CodingKey {
        case height
        case htmlAttributions = "html_attributions"
        case photoReference = "photo_reference"
        case width
    }
}
