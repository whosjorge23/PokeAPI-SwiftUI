//
//  PokemonModel.swift
//  PokeAPI SwiftUI
//
//  Created by Giorgio Giannotta on 11/02/23.
//

import Foundation


//Codable, Identifiable, Equatable are Swift protocols
//Codable: it's used when you must serialize(to trasform and object to JSON) and deserialize(to trasform and object a SwiftOBJ) the JSON
//Identifiable: It's used when you want to use and ID to identify the instance
//Equatable: It's used when you wnat to check if the instance are ==

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct PokemonDetail: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let types: [Types]?
    let abilities: [Abilities]?
    let stats: [Stats]
}

struct Types: Codable {
    let slot: Int
    let type: PokeType
}

struct PokeType: Codable {
    let name: String
    let url: String
}

struct Abilities: Codable {
    let slot: Int
    let ability: PokeAbility
    let is_hidden: Bool
}

struct PokeAbility: Codable {
    let name: String
    let url: String
}

struct Stats: Codable {
    let base_stat: Int
    let effort: Int
    let stat: PokeStat
}

struct PokeStat: Codable {
    let name: String
    let url: String
}
