//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import SwiftUI

import Kingfisher

struct CharacterRowView: View {
    let character: Character
    
    var body: some View {
        HStack(spacing: 16) {
            image
            details
            Spacer()
        }
    }
    
    private var image: some View {
        KFImage(URL(string: character.image ?? ""))
            .placeholder {
                ProgressView()
            }
            .cacheOriginalImage()
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .aspectRatio(contentMode: .fill)
            .frame(width: 60, height: 60)
    }
    
    private var details: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(character.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(R.string.localizable.characterListCardSpecie(character.species ?? ""))
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
        }
    }
}

#Preview {
    CharacterRowView(character: .init(id: "", name: ""))
}
