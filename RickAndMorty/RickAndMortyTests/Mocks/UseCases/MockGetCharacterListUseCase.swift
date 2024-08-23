//
//  MockGetCharacterListUseCase.swift
//  RickAndMortyTests
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine
@testable import RickAndMorty

class MockGetCharacterListUseCase: GetCharacterListUseCaseType {
    func execute(page: Int) -> AnyPublisher<[Character], NetworkError> {
        var expectedCharacters = [Character]()
        
        let jsonData = JSONHelper.loadJSONData(fromFilename: "characterListSuccessStub") ?? Data()
        let response = try? JSONDecoder().decode([Character].self, from: jsonData)
        expectedCharacters = response ?? []
        
        return Just(expectedCharacters)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}
