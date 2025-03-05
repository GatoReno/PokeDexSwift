//
//  PokemonServiceProtocol.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import Foundation
import Combine
protocol PokemonServiceProtocol {
    func fetchPokemon(named name: String) -> AnyPublisher<Pokemon, Error>
}
