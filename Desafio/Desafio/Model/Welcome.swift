//
//  Welcome.swift
//  Desafio
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 21/07/21.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let htmlAttributions: [JSONAny]
    let nextPageToken: String
    let results: [Result]
    let status: String

    enum CodingKeys: String, CodingKey {
        case htmlAttributions = "html_attributions"
        case nextPageToken = "next_page_token"
        case results, status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.htmlAttributions = try! container.decodeIfPresent([JSONAny].self, forKey: .htmlAttributions) ?? []
        self.nextPageToken = try container.decodeIfPresent(String.self, forKey: .nextPageToken) ?? ""
        self.results = try container.decodeIfPresent([Result].self, forKey: .results) ?? []
        self.status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
    }
}
