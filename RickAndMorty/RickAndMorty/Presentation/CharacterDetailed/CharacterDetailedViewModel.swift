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
    @Published private(set) var isLoading: Bool = false
    
    private(set) var dependencies: Dependencies
    private var cancellables = Set<AnyCancellable>()
    
    var image: String {
        character?.image ?? ""
    }
    
    var species: String {
        character?.species ?? ""
    }
    
    var gender: String {
        character?.gender ?? ""
    }
    
    var type: String {
        character?.type ?? ""
    }
    
    var status: String {
        character?.status ?? ""
    }
    
    var episode: [Episode] {
        character?.episode ?? []
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func fetchCharacters(id: String) {
        isLoading = true
        
        dependencies
            .characterUseCase
            .execute(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                // TODO: Here we can hundle error and display it in an alert
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
                
                self?.isLoading = false
            }, receiveValue: { [weak self] character in
                guard let self = self else { return }
                
                self.character = character
            })
            .store(in: &cancellables)
    }
}
