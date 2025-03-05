//
//  ChangeColorButtonStyle.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import Foundation
import SwiftUI
struct ChangeColorButtonStyle: ButtonStyle {
    @State private var isPressed = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label 
            .background(isPressed ? Color.green : Color.blue)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .onChange(of: configuration.isPressed) { newValue in
                // Update the state based on button press
                isPressed = newValue
            }
    }
}
