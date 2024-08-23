//
//  GetCharacterDetailUseCase.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine

class GetCharacterDetailUseCase: GetCharacterDetailUseCaseType {
    private let repository: CharacterRepositoryType

    init(repository: CharacterRepositoryType) {
        self.repository = repository
    }

    func execute(id: String) -> AnyPublisher<Character, NetworkError> {
        return repository.getCharacterDetail(id: id)
    }
}
