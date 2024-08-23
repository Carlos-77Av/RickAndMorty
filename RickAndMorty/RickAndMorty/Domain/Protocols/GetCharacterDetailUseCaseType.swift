//
//  GetCharacterDetailUseCaseType.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine

protocol HasGetCharacterDetailUseCase {
    var characterUseCase: GetCharacterDetailUseCaseType { get }
}

protocol GetCharacterDetailUseCaseType {
    func execute(id: String) -> AnyPublisher<Character, NetworkError>
}
