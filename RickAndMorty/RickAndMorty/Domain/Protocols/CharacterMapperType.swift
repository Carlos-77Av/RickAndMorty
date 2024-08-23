//
//  CharacterMapperType.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Rickandmortyapi

protocol HasCharacterMapper {
    var mapper: CharacterMapperType { get }
}

protocol CharacterMapperType {
    func map(graphqlData: CharacterListQuery.Data) -> [Character]
    func map(graphqlData: GetCharacterDetailQuery.Data) -> Character?
}
