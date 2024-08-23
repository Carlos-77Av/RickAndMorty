//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 21/8/24.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel: CharacterListViewModel
    @State private var offset: CGFloat = -20
    
    var body: some View {
        mainContent
            .navigationTitle(R.string.localizable.characterListNavbarTitle())
            .background(appBackground)
            .onAppear {
                viewModel.fetchCharacters()
            }
    }
    
    private var mainContent: some View {
        VStack {
            if viewModel.showProgressView {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    characterList
                }
                .listStyle(.plain)
            }
        }
    }
    
    private var characterList: some View {
        ForEach(viewModel.characterList, id: \.id) { character in
            NavigationLink(
                destination: CharacterDetailedView(
                    viewModel: .init(dependencies: CharacterDetailedViewModelDependencies()),
                    character: character)
            ) {
                CharacterRowView(character: character)
            }
            .cardStyle()
            .onAppear {
                viewModel.loadMoreIfNeeded(currentItem: character)
            }
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
    
    private var appBackground: some View {
        Image(R.image.appBackground)
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
            .overlay(Color.black.opacity(0.5))
            .offset(y: offset)
            .onAppear {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    offset = 20
                }
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
