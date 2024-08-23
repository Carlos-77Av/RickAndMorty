//
//  CharacterRepository.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine
import Rickandmortyapi

class CharacterRepository: CharacterRepositoryType {
    typealias Dependencies = HasNetworkClient & HasCharacterMapper
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func getCharacterList(page: Int) -> AnyPublisher<[Character], NetworkError> {
        let query = CharacterListQuery(page: .some(page))
        
        return dependencies
            .client
            .request(for: query)
            .compactMap { [weak self] graphqlResult in
                self?.dependencies.mapper.map(graphqlData: graphqlResult)
            }
            .eraseToAnyPublisher()
    }
    
    func getCharacterDetail(id: String) -> AnyPublisher<Character, NetworkError> {
        let query = GetCharacterDetailQuery(id: id)
        
        return dependencies
            .client
            .request(for: query)
            .flatMap { [weak self] graphqlData -> AnyPublisher<Character, NetworkError> in
                if let character = self?.dependencies.mapper.map(graphqlData: graphqlData) {
                    return Just(character)
                        .setFailureType(to: NetworkError.self)
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: NetworkError.emptyData)
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
