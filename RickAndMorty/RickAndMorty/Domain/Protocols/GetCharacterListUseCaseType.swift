//
//  GetCharacterListUseCaseType.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Combine

protocol HasGetCharacterListUseCase {
    var characterUseCase: GetCharacterListUseCaseType { get }
}

protocol GetCharacterListUseCaseType {
    func execute(page: Int) -> AnyPublisher<[Character], NetworkError>
}
