//
//  GetCharacterListUseCase.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine

class GetCharacterListUseCase: GetCharacterListUseCaseType {
    private let repository: CharacterRepositoryType

    init(repository: CharacterRepositoryType) {
        self.repository = repository
    }

    func execute(page: Int) -> AnyPublisher<[Character], NetworkError> {
        return repository.getCharacterList(page: page)
    }
}
