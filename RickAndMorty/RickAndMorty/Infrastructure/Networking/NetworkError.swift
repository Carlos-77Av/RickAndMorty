//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Apollo

enum NetworkError: Error, LocalizedError {
    case network(URLError)
    case graphQL([GraphQLError])
    case unknown(Error)
    case emptyData

    var errorDescription: String? {
        switch self {
        case .network(let urlError):
            return urlError.localizedDescription
        case .graphQL(let errors):
            return errors.map { $0.localizedDescription }.joined(separator: ", ")
        case .unknown(let error):
            return error.localizedDescription
        case .emptyData:
            return "There's no info to show"
        }
    }
}
