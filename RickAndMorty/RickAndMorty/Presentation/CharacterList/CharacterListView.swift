//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 21/8/24.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel: CharacterListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.characterList, id: \.id) { character in
                NavigationLink {
                    Text(" \(character.id) - \(character.name)")
                } label: {
                    Text(" \(character.id) - \(character.name)")
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Rick and Morty")
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}

#Preview {
    CharacterListView(
        viewModel: .init(
            dependencies: CharacterListViewModelDependencies()
        )
    )
}
