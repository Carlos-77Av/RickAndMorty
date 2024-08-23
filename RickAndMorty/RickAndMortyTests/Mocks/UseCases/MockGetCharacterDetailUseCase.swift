//
//  MockGetCharacterDetailUseCase.swift
//  RickAndMortyTests
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine
@testable import RickAndMorty

class MockGetCharacterDetailUseCase: GetCharacterDetailUseCaseType {
    func execute(id: String) -> AnyPublisher<Character, NetworkError> {
        let jsonData = JSONHelper.loadJSONData(fromFilename: "CharacterDatailSuccessStub") ?? Data()
        let response = try? JSONDecoder().decode(Character.self, from: jsonData)
        
        if let response = response {
            return Just(response)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        } else {
            
        }
        return Fail(error: NetworkError.emptyData).eraseToAnyPublisher()
    }
}
