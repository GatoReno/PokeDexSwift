//
//  TimerViewModel.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var showToast: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        startTimer()
    }
    
    private func startTimer() {
        // Timer will trigger every 2 minutes
        Timer.publish(every: 12, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.showToast.toggle() // Toggle the toast visibility
                // Hide the toast after 3 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.showToast.toggle() // Hide toast after 3 seconds
                }
            }
            .store(in: &cancellables)
    }
}

