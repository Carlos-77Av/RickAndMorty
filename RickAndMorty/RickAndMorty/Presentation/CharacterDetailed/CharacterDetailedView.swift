//
//  CharacterDetailedView.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import SwiftUI
import Kingfisher

struct CharacterDetailedView: View {
    @StateObject var viewModel: CharacterDetailedViewModel
    
    let character: Character
    
    var body: some View {
        mainContent
            .navigationTitle(character.name)
            .navigationBarTitleDisplayMode(.inline)
            .background(backgroundColor)
            .onAppear {
                viewModel.fetchCharacters(id: character.id)
            }
    }
    
    private var mainContent: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                characterInformation
            }
        }
    }
    
    private var characterInformation: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                image
                basicInformation
                locationSection
                episodeList
            }
            .padding(.bottom, 20)
        }
    }
    
    private var image: some View {
        KFImage(URL(string: viewModel.image))
            .placeholder {
                ProgressView()
            }
            .cacheOriginalImage()
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxHeight: 250)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(16)
    }
    
    private var basicInformation: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.character?.name ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack {
                Text(R.string.localizable.characterDetailedSpecies(viewModel.species))
                
                Spacer()
                
                Text(R.string.localizable.characterDetailedGender(viewModel.gender))
            }
            
            HStack {
                Text(R.string.localizable.characterDetailedType(viewModel.type))
                
                Spacer()
                
                Text(R.string.localizable.characterDetailedStatus(viewModel.status))
            }
            .padding(.bottom, 8)
        }
        .cardStyle()
        .padding(.horizontal)
    }
    
    private var locationSection: some View {
        Group {
            if let location = viewModel.character?.location {
                VStack(alignment: .leading, spacing: 8) {
                    Text(R.string.localizable.characterDetailedLocationTitle)
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    HStack {
                        Text(R.string.localizable.characterDetailedLocationName(location.name ?? ""))
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text(R.string.localizable.characterDetailedLocationType(location.type ?? ""))
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Text(R.string.localizable.characterDetailedLocationDimension(location.dimension ?? ""))
                            .font(.subheadline)
                        
                        Spacer()
                    }
                }
                .cardStyle()
                .padding(.horizontal)
            }
        }
    }
    
    private var episodeList: some View {
        LazyVStack(alignment: .leading, spacing: 8) {
            Text(R.string.localizable.characterDetailedEpisodesTitle)
                .font(.headline)
                .padding(.bottom, 4)
            
            ForEach(viewModel.episode, id: \.self) { episode in
                HStack {
                    Text(episode.name)
                    Spacer()
                    Text(episode.episode)
                }
                .padding()
                .background(Color(.systemGray6).opacity(0.5))
                .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
    
    private var backgroundColor: some View {
        ZStack {
            Color.black
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.green.opacity(0.2),
                        Color.black.opacity(0.3)
                    ]
                ),
                startPoint: .top,
                endPoint: .bottomTrailing
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CharacterDetailedView(
        viewModel: .init(dependencies: CharacterDetailedViewModelDependencies()),
        character: .init(id: "1", name: "Rick")
    )
}
