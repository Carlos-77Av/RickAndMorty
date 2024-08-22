//
//  NetworkClientType.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine
import Apollo
import ApolloAPI

protocol HasNetworkClient {
    var client: NetworkClientType { get }
}

protocol NetworkClientType {
    func request<Query: GraphQLQuery>(for query: Query) -> AnyPublisher<Query.Data, Error>
}
