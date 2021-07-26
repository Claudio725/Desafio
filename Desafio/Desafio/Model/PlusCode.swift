//
//  PlusCode.swift
//  Desafio
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 21/07/21.
//

import Foundation

// MARK: - PlusCode
struct PlusCode: Codable {
    let compoundCode, globalCode: String

    enum CodingKeys: String, CodingKey {
        case compoundCode = "compound_code"
        case globalCode = "global_code"
    }
}

