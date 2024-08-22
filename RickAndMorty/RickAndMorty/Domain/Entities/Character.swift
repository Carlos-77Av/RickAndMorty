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
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var image: String?
    var location: Location?
    var episode: [Episode]?
}
