//
//  CharacterDetailedViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Carlos Alvarez on 22/8/24.
//

import XCTest
import Combine
@testable import RickAndMorty

final class CharacterDetailedViewModelTests: XCTestCase {
    var viewModel: CharacterDetailedViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        let dependencies = MockCharacterDetailedViewModelDependencies(
            useCase: MockGetCharacterDetailUseCase()
        )
        
        viewModel = CharacterDetailedViewModel(dependencies: dependencies)
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewModel = nil
    }
    
    func testFetchCharactersSuccess() {
        // GIVEN
        let expectation = XCTestExpectation(description: "Character Detail loaded")
        
        // WHEN
        viewModel.$character
            .dropFirst()
            .delay(for: .milliseconds(200), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                XCTAssertTrue(!self.viewModel.image.isEmpty)
                XCTAssertEqual(self.viewModel.species, "Human")
                XCTAssertEqual(self.viewModel.gender, "Male")
                XCTAssertEqual(self.viewModel.type, "")
                XCTAssertEqual(self.viewModel.status, "Alive")
                XCTAssertTrue(!self.viewModel.episode.isEmpty)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.fetchCharacters(id: "1")
        
        // THEN
        wait(for: [expectation], timeout: 1.0)
    }
}
