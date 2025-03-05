//
//  ToastView.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import Foundation
import SwiftUI

struct ToastView: View {
    let message: String
    let showToast: Bool
    
    var body: some View {
        VStack {
            Spacer()
            if showToast {
                Text(message)
                    .padding()
                    .background(Color.black.opacity(0.7), in: RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.white)
                    .opacity(showToast ? 1 : 0) // Control the opacity for fade-in/fade-out
                    .animation(.easeOut(duration: 1.0), value: showToast) // Slower opacity transition (1.0 seconds)
                    .transition(.move(edge: .bottom)) 
            }
        }
        .padding(.bottom, 50)
        .animation(.easeInOut, value: showToast) // Animating the show/hide of the toast
    }
}
