//
//  Content-ViewModel.swift
//  PokeAPI SwiftUI
//
//  Created by Giorgio Giannotta on 11/02/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var favoritePokemon = [Pokemon]()
    @Published var pokemonDetails: PokemonDetail?
    @Published var searchText = ""
    @Published var showOnlyFavorites = false
    
    // Used with searchText to filter pokemon results
    var filteredPokemon: [Pokemon] {
        if showOnlyFavorites {
            return searchText == "" ? favoritePokemon : favoritePokemon.filter { $0.name.contains(searchText.lowercased()) }
        } else {
            return searchText == "" ? pokemonList : pokemonList.filter { $0.name.contains(searchText.lowercased()) }
        }
                
            }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    
    // Get the index of a pokemon ( index + 1 = pokemon id)
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    //Add Pokemon to the favorite List
    func addToFavorites(pokemon: Pokemon) {
            if !favoritePokemon.contains(pokemon){
                favoritePokemon.append(pokemon)
            }else{
                let index = favoritePokemon.firstIndex(of: pokemon)
                favoritePokemon.remove(at: index!)
            }
    }
    
    // Get specific details for a pokemon
    func getDetails(pokemon: Pokemon) {
            let id = getPokemonIndex(pokemon: pokemon)
            
            self.pokemonDetails = PokemonDetail(
                id: 0,
                height: 0,
                weight: 0,
                types: nil,
                abilities: nil,
                stats: [
                    Stats(
                        base_stat: 0,
                        effort: 0,
                        stat: PokeStat(name: "hp", url: "url")),
                    Stats(
                        base_stat: 0,
                        effort: 0,
                        stat: PokeStat(name: "hp", url: "url")),
                    Stats(
                        base_stat: 0,
                        effort: 0,
                        stat: PokeStat(name: "hp", url: "url")),
                    Stats(
                        base_stat: 0,
                        effort: 0,
                        stat: PokeStat(name: "hp", url: "url")),
                    Stats(
                        base_stat: 0,
                        effort: 0,
                        stat: PokeStat(name: "hp", url: "url")),
                    Stats(
                        base_stat: 0,
                        effort: 0,
                        stat: PokeStat(name: "hp", url: "url")
                    )
                ]
            )
            
            pokemonManager.getPokemonDetail(id: id) { data in
                DispatchQueue.main.async {
                    self.pokemonDetails = data
                }
            }
        }

    
    // Formats the Height or the Weight of a given pokemon
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
}
