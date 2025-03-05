//
//  PokemonService.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import Foundation
import Combine

protocol PokemonServiceProtocol {
    func fetchPokemon(named name: String) -> AnyPublisher<Pokemon, Error>
}

class PokemonService: PokemonServiceProtocol {
    // Base URL for the API
    private let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
    
    func fetchPokemon(named name: String) -> AnyPublisher<Pokemon, Error> {
        // Construct the URL with the dynamic name parameter
        guard let url = URL(string: baseUrl + name.lowercased()) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        // Perform the network request
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Pokemon.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
