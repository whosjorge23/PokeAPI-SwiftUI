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
    let dimensions: Double = 150
    
    var body: some View {
        VStack {
            KFImage(URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png"))
                .resizable()
                .scaledToFit()
                .frame(width: dimensions, height: dimensions)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
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

            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)

        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
