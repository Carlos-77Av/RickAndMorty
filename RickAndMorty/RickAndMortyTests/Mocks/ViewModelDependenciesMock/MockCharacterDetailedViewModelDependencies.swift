//
//  MockCharacterDetailedViewModelDependencies.swift
//  RickAndMortyTests
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
@testable import RickAndMorty

struct MockCharacterDetailedViewModelDependencies: CharacterDetailedViewModel.Dependencies {
    var characterUseCase: GetCharacterDetailUseCaseType
    
    init(useCase: GetCharacterDetailUseCaseType) {
        self.characterUseCase = useCase
    }
}
