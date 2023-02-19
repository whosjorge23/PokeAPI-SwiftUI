//
//  PokemonView.swift
//  PokeAPI SwiftUI
//
//  Created by Giorgio Giannotta on 11/02/23.
//

import SwiftUI
import Kingfisher

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let detailView : Bool 
    let dimensions: Double = 150
    
    var body: some View {
        VStack {
            VStack {
                if detailView {
                    Text("\(pokemon.name.capitalized)")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                .padding(.bottom, 10)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
            if !detailView {
                KFImage(URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensions, height: dimensions)
                    .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                VStack {
                    Text("Normal")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                    HStack {
                        KFImage(URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimensions, height: dimensions)
                            .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        KFImage(URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/\(vm.getPokemonIndex(pokemon: pokemon)).png"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimensions, height: dimensions)
                            .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    HStack {
                        KFImage(URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/\(vm.getPokemonIndex(pokemon: pokemon)).png"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimensions, height: dimensions)
                            .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        KFImage(URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/\(vm.getPokemonIndex(pokemon: pokemon)).png"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimensions, height: dimensions)
                            .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    Text("Shiny")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                }
            }
            
//            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
//                if let image = image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: dimensions, height: dimensions)
//                }
//            } placeholder: {
//                ProgressView()
//                    .frame(width: dimensions, height: dimensions)
//                    
//            }
//            .background(.thinMaterial)
//            .clipShape(RoundedRectangle(cornerRadius: 20))

            VStack {
                if !detailView {
                    Text("\(pokemon.name.capitalized)")
                    .font(.system(size: 16, weight: .semibold, design: .monospaced))
                .padding(.bottom, 20)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }

        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon, detailView: true)
            .environmentObject(ViewModel())
    }
}
