//
//  CharacterDetailedView.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import SwiftUI

struct CharacterDetailedView: View {
    @StateObject var viewModel: CharacterDetailedViewModel
    
    let character: Character
    
    var body: some View {
        Text(character.name)
            .onAppear {
                viewModel.fetchCharacters(id: character.id)
            }
    }
}

#Preview {
    CharacterDetailedView(
        viewModel: .init(dependencies: CharacterDetailedViewModelDependencies()),
        character: .init(id: "1", name: "Rick")
    )
}
