//
//  Extensions+UINavigationBar.swift
//  RickAndMorty
//
//  Created by Carlos Alvarez on 22/8/24.
//

import SwiftUI

extension UINavigationBar {
    static func setCustomAppearance() {
        let appearanceStandar = UINavigationBarAppearance()
        
        appearanceStandar.configureWithDefaultBackground()
        appearanceStandar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        UINavigationBar.appearance().standardAppearance = appearanceStandar
    }
}
