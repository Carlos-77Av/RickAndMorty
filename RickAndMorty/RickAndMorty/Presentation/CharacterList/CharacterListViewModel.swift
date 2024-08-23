//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine

struct CharacterListViewModelDependencies: CharacterListViewModel.Dependencies {
    var characterUseCase: GetCharacterListUseCaseType = GetCharacterListUseCase(
        repository: CharacterRepository(dependencies: RepositoryDependencies()))
}

class CharacterListViewModel: ObservableObject {
    typealias Dependencies = HasGetCharacterListUseCase
    
    @Published private(set) var characterList = [Character]()
    @Published private(set) var isLoading: Bool = false
    
    private(set) var dependencies: Dependencies
    private var cancellables = Set<AnyCancellable>()
    private var currentPage: Int = 1
    
    var showProgressView: Bool {
        isLoading && characterList.isEmpty
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func fetchCharacters() {
        isLoading = true
        
        dependencies
            .characterUseCase
            .execute(page: currentPage)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                // TODO: Here we can hundle error and display it in an alert
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
                
                self?.isLoading = false
            }, receiveValue: { [weak self] characters in
                guard let self = self, !characters.isEmpty else { return }
                
                self.characterList.append(contentsOf: characters)
                self.currentPage += 1
            })
            .store(in: &cancellables)
    }
    
    func loadMoreIfNeeded(currentItem character: Character?) {
        guard let character = character else {
            fetchCharacters()
            return
        }
        
        let indexTriggerPagination = characterList.index(characterList.endIndex, offsetBy: -5)
        
        if characterList.firstIndex(where: { $0.id == character.id }) == indexTriggerPagination {
            fetchCharacters()
        }
    }
}
