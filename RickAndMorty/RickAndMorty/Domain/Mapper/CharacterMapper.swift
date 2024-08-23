//
//  CharacterMapper.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Rickandmortyapi

struct CharacterMapper: CharacterMapperType {
    func map(graphqlData: CharacterListQuery.Data) -> [Character] {
        guard let characters = graphqlData.characters?.results else { return [] }
        
        return characters.map {
            Character(
                id: $0?.id ?? "",
                name: $0?.name ?? "",
                species: $0?.species,
                image: $0?.image
            )
        }
    }
    
    func map(graphqlData: GetCharacterDetailQuery.Data) -> Character? {
        guard let character = graphqlData.character else { return nil }
        
        return Character(
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
            episode: character.episode.map {
                Episode(name: $0?.name ?? "", episode: $0?.episode ?? "")
            }
        )
    }
}

