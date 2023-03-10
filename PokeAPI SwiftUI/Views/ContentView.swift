//
//  ContentView.swift
//  PokeAPI SwiftUI
//
//  Created by Giorgio Giannotta on 11/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)
                        ) {
                            PokemonView(pokemon: pokemon, detailView: false)    
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("Pokedex PokeAPI")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
            .navigationBarItems(trailing: Button(action: {
                        // Add your code to mark the selected pokemon as a favorite
                vm.showOnlyFavorites = !vm.showOnlyFavorites
                    }, label: {
                        Image(systemName: "star")
                            .foregroundColor(vm.showOnlyFavorites ? Color.yellow : Color.blue)
                    }))
                
        }
        //This function allow to pass the ViewModel to all the SubView in a more easy way, avoid to instanciate the vm in every SubView
        .environmentObject(vm)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
