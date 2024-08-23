//
//  MockCharacterListViewModelDependencies.swift
//  RickAndMortyTests
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
@testable import RickAndMorty

struct MockCharacterListViewModelDependencies: CharacterListViewModel.Dependencies {
    var characterUseCase: GetCharacterListUseCaseType
    
    init(useCase: GetCharacterListUseCaseType) {
        self.characterUseCase = useCase
    }
}
