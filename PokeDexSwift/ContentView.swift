//
//  ContentView.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TimerViewModel()
    @State private var buttonColor: Color = .blue
    private var vibrationService: VibrationProtocol = VibrationService()
    
    var body: some View {
        NavigationView(content: {
            NavigationLink(destination: SecondView())
            { VStack
                {
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
                    HStack
                    {
                        Button("Start Timer") {
                            viewModel.startTimer()
                            
                        }.padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Button("Stop Timer"){
                            viewModel.stopTimer()
                        } .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    ToastView(message: "This is your toast notification!", showToast: viewModel.showToast,vibrationService: vibrationService)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding()
            }
            
            
        }).onAppear()
        {
            viewModel.startTimer()
        }
        
        
    }
}

#Preview {
    ContentView()
}
