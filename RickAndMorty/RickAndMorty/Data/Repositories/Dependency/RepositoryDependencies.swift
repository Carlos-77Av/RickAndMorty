//
//  RepositoryDependencies.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation

struct RepositoryDependencies: CharacterRepository.Dependencies {
    var client: NetworkClientType = GraphQLClient(
        client: .init(
            url: URL(string: AppConfig.shared.url)!
        )
    )
}
