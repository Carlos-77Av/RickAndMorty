//
//  GraphQLClient.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine
import Apollo
import ApolloAPI

class GraphQLClient: NetworkClientType {
    private let client: ApolloClient
    
    public init(client: ApolloClient) {
        self.client = client
    }

    func request<Query>(for query: Query) -> AnyPublisher<Query.Data, NetworkError> where Query : GraphQLQuery {
        Future { [weak self] promise in
            self?.client.fetch(query: query) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        promise(.success(data))
                    } else if let errors = graphQLResult.errors {
                        promise(.failure(.graphQL(errors)))
                    } else {
                        promise(.failure(.emptyData))
                    }
                case .failure(let error):
                    if let urlError = error as? URLError {
                        promise(.failure(.network(urlError)))
                    } else {
                        promise(.failure(.unknown(error)))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
