//
//  PokemonStruct.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import Foundation
struct Pokemon: Identifiable, Codable {
    let id: Int
    let name: String
    let species: Species
    let height: Float
    let weight: Float
    
    struct Species: Codable {
        let name: String
    }
}
