//
//  JSONCodingKey.swift
//  Desafio
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 22/07/21.
//

import Foundation
class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}
