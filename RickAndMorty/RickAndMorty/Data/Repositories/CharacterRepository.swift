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
    typealias Dependencies = HasNetworkClient
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func getCharacterList(page: Int) -> AnyPublisher<[Character], NetworkError> {
        let query = CharacterListQuery(page: .some(page))
        
        return dependencies
            .client
            .request(for: query)
            .compactMap { graphqlData in
                guard let characters = graphqlData.characters?.results else { return [] }
                
                return characters.map { Character(id: $0?.id ?? "", name: $0?.name ?? "", species: $0?.species, image: $0?.image) }
            }
            .eraseToAnyPublisher()
    }
}
