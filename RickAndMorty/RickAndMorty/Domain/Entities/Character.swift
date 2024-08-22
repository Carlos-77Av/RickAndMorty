//
//  Character.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation

struct Character {
    let id: String
    let name: String
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let image: String?
    let episode: [Episode]?
}
