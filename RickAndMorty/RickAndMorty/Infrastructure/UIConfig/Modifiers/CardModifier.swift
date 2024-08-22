//
//  CardModifier.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.white)
            .padding()
            .background(Color(.darkGray).opacity(0.4))
            .cornerRadius(15)
            .shadow(
                color: .black.opacity(0.3),
                radius: 5, x: 0, y: 2
            )
    }
}
