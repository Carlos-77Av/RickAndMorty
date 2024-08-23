//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Carlos Alvarez on 21/8/24.
//

import XCTest
import Combine
@testable import RickAndMorty

final class CharacterListViewModelTests: XCTestCase {
    var viewModel: CharacterListViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        let dependencies = MockCharacterListViewModelDependencies(
            useCase: MockGetCharacterListUseCase()
        )
        
        let viewModel = CharacterListViewModel(dependencies: dependencies)
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewModel = nil
    }
    
    func testFetchCharactersSuccess() {
        // GIVEN
        let expectation = XCTestExpectation(description: "Characters loaded")
        
        // WHEN
        viewModel.$characterList
            .dropFirst()
            .sink { characters in
                XCTAssertEqual(characters.first?.name, "Rick Sanchez")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.fetchCharacters()
        
        // THEN
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testLoadMoreIfNeeded() {
        // GIVEN
        let expectation = XCTestExpectation(description: "Characters loaded")
        
        // WHEN
        viewModel.$characterList
            .dropFirst(2)
            .delay(for: .milliseconds(500), scheduler: DispatchQueue.global())
            .sink { characters in
                XCTAssertEqual(characters.first?.name, "Rick Sanchez")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.loadMoreIfNeeded(currentItem: nil)
        viewModel.loadMoreIfNeeded(currentItem: viewModel.characterList.last)
        
        // THEN
        wait(for: [expectation], timeout: 1.0)
    }
}
