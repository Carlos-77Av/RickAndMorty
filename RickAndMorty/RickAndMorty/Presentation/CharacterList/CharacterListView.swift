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
                    Text("\(character.id) - \(character.name)")
                } label: {
                    Text("\(character.id) - \(character.name)")
                }
                .onAppear {
                    viewModel.loadMoreIfNeeded(currentItem: character)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(R.string.localizable.characterListNavbarTitle())
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
