//
//  CharacterDetailedViewModel.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import Foundation
import Combine

struct CharacterDetailedViewModelDependencies: CharacterDetailedViewModel.Dependencies {
    var characterUseCase: GetCharacterDetailUseCaseType = GetCharacterDetailUseCase(
        repository: CharacterRepository(dependencies: RepositoryDependencies()))
}

class CharacterDetailedViewModel: ObservableObject {
    typealias Dependencies = HasGetCharacterDetailUseCase
    
    @Published private(set) var character: Character?
    
    private(set) var dependencies: Dependencies
    private var cancellables = Set<AnyCancellable>()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func fetchCharacters(id: String) {
        dependencies
            .characterUseCase
            .execute(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] character in
                guard let self = self else { return }
                
                self.character = character
                print(character)
            })
            .store(in: &cancellables)
    }
}
