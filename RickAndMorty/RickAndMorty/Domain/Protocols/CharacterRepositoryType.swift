//
//  CharacterRepositoryType.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine

protocol HasCharacterRepository {
    var repository: CharacterRepositoryType { get }
}

protocol CharacterRepositoryType {
    func getCharacterList(page: Int) -> AnyPublisher<[Character], NetworkError>
    func getCharacterDetail(id: String) -> AnyPublisher<Character, NetworkError>
}
