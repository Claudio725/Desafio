//
//  CodableBundleExtension.swift
//  Desafio challenge
//
//  Created by CLAUDIO JOSÉ DA SILVA MENEZES on 23/04/21.
//

import Foundation

extension Bundle {
    func decode(latitude: Double, longitude: Double) -> Welcome?{
        //1 - Ler a API

        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyBZfkkCp0l7i4h_jxYWHVA2kjtCbRz7FHw") else {
            fatalError("Falha em encontrar a api")
        }
        //2 - criar a propriedade para o data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Falha ao carregar no bundle")
        }
        
        //3 - Criar o decoder
        let decoder = JSONDecoder()
        
        //4 - Criar a propriedade para o data decoded
//        let result: Result = try! decoder.decode(Result.self, from: data)
//
//        let geomety = try? decoder.decode(Geometry.self, from: data)
//
//        let location = try? decoder.decode(Location.self, from: data)
//
//        let openingHours  = try? decoder.decode(OpeningHours.self, from: data)
//
//        let photo = try? decoder.decode(Photo.self, from: data)
//
//        let plusCode = try? decoder.decode(PlusCode.self, from: data)
        
        
        let welcome:Welcome? = try? decoder.decode(Welcome.self, from: data)
        
        return welcome
}
}
