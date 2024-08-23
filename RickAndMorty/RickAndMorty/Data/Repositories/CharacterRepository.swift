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
    
    func getCharacterDetail(id: String) -> AnyPublisher<Character, NetworkError> {
        let query = GetCharacterDetailQuery(id: id)
        
        return dependencies
            .client
            .request(for: query)
            .flatMap { graphqlData -> AnyPublisher<Character, NetworkError> in
                if let character = graphqlData.character {
                    let mappedCharacter = Character(
                        id: character.id ?? "",
                        name: character.name ?? "",
                        status: character.status, 
                        species: character.species,
                        gender: character.gender,
                        image: character.image,
                        location: Location(
                            name: character.location?.name,
                            type: character.location?.type,
                            dimension: character.location?.dimension
                        ),
                        episode: character.episode.map { Episode(name: $0?.name ?? "", episode: $0?.episode ?? "") }
                    )
                    return Just(mappedCharacter)
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
