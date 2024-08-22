//
//  Extension+View.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import SwiftUI

extension View {
    func cardStyle() -> some View {
        self.modifier(CardModifier())
    }
}
