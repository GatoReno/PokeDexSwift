//
//  ContentView.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonColor: Color = .blue
    
    var body: some View {
        NavigationView(content: {
            NavigationLink(destination: SecondView()) { VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                Button(action: {
                    // Change the button color when it's tapped
                    buttonColor = buttonColor == .blue ? .green : .blue}) {
                        Text("Tap to Change Color")
                            .padding(30)
                            .foregroundColor(.white)
                            .background(buttonColor)
                        
                    }
                    .buttonStyle(ChangeColorButtonStyle())
                    .padding()
            }
            .padding() }
        })
    }
}

#Preview {
    ContentView()
}
