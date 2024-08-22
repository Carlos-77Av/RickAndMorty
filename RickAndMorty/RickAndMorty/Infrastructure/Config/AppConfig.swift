//
//  AppConfig.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Keys

final class AppConfig {
    static let shared: AppConfig = .init()
    
    private let keys = RickAndMortyKeys()
    
    private init() {}
    
    var url: String {
        keys.graphQLURL
    }
}
