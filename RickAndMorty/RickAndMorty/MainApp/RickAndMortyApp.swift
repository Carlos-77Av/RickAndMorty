//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 21/8/24.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    init() {
        UINavigationBar.setCustomAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CharacterListView(
                    viewModel: .init(
                        dependencies: CharacterListViewModelDependencies()
                    )
                )
                .preferredColorScheme(.dark)
            }
        }
    }
}
