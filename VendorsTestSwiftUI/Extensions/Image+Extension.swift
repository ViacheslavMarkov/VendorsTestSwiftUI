//
//  Image+Extension.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: UIScreen.main.bounds.width / 3)
            .foregroundColor(.purple)
            .opacity(0.6)
    }
}
