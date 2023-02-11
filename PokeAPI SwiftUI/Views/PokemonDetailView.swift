//
//  PokemonDetailView.swift
//  PokeAPI SwiftUI
//
//  Created by Giorgio Giannotta on 11/02/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10) {
                
                Group {
                    Text("**Info**")
                    HStack {
                        Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                        Spacer()
                        Text("**Type**: \(vm.pokemonDetails?.types[0].type.name.capitalized ?? "Unknown")")
                    }
                    HStack {
                        Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                        Spacer()
                        Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) M")
                    }
                }
                
                Group {
                    Text("**Abilities**")
                    HStack {
                        Text("*\(vm.pokemonDetails?.abilities[0].ability.name.capitalized ?? "HP")*")
                        Spacer()
                        Text("*\(vm.pokemonDetails?.abilities[1].ability.name.capitalized ?? "HP")*")
                    }
                }
                
                Group {
                    Text("**Statistics**")
    //                Text("**\(vm.pokemonDetails?.stats[0].stat.name.capitalized ?? "HP")**: \(vm.pokemonDetails?.stats[0].base_stat ?? 0)")
                    ProgressView("**\(vm.pokemonDetails?.stats[0].stat.name.capitalized ?? "HP")**: \(vm.pokemonDetails?.stats[0].base_stat ?? 0)", value: Double(vm.pokemonDetails?.stats[0].base_stat ?? 0)/100, total: 2.0)
                    
    //                Text("**\(vm.pokemonDetails?.stats[1].stat.name.capitalized ?? "Attack")**: \(vm.pokemonDetails?.stats[1].base_stat ?? 0)")
                    ProgressView("**\(vm.pokemonDetails?.stats[1].stat.name.capitalized ?? "Attack")**: \(vm.pokemonDetails?.stats[1].base_stat ?? 0)", value: Double(vm.pokemonDetails?.stats[1].base_stat ?? 0)/100, total: 2.0)
                    
    //                Text("**\(vm.pokemonDetails?.stats[2].stat.name.capitalized ?? "Defense")**: \(vm.pokemonDetails?.stats[2].base_stat ?? 0)")
                    ProgressView("**\(vm.pokemonDetails?.stats[2].stat.name.capitalized ?? "Defense")**: \(vm.pokemonDetails?.stats[2].base_stat ?? 0)", value: Double(vm.pokemonDetails?.stats[2].base_stat ?? 0)/100, total: 2.0)
                    
    //                Text("**\(vm.pokemonDetails?.stats[3].stat.name.capitalized ?? "Special-Attack")**: \(vm.pokemonDetails?.stats[3].base_stat ?? 0)")
                    ProgressView("**\(vm.pokemonDetails?.stats[3].stat.name.capitalized ?? "Special-Attack")**: \(vm.pokemonDetails?.stats[3].base_stat ?? 0)", value: Double(vm.pokemonDetails?.stats[3].base_stat ?? 0)/100, total: 2.0)
                    
    //                Text("**\(vm.pokemonDetails?.stats[4].stat.name.capitalized ?? "Special-Defense")**: \(vm.pokemonDetails?.stats[4].base_stat ?? 0)")
                    ProgressView("**\(vm.pokemonDetails?.stats[4].stat.name.capitalized ?? "Special-Defense")**: \(vm.pokemonDetails?.stats[4].base_stat ?? 0)", value: Double(vm.pokemonDetails?.stats[4].base_stat ?? 0)/100, total: 2.0)
                    
    //                Text("**\(vm.pokemonDetails?.stats[5].stat.name.capitalized ?? "Speed")**: \(vm.pokemonDetails?.stats[5].base_stat ?? 0)")
                    ProgressView("**\(vm.pokemonDetails?.stats[5].stat.name.capitalized ?? "Speed")**: \(vm.pokemonDetails?.stats[5].base_stat ?? 0)", value: Double(vm.pokemonDetails?.stats[5].base_stat ?? 0)/100, total: 2.0)
                }
                
                
            }
            .padding()
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
