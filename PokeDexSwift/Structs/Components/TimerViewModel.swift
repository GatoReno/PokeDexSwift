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
    private var timer: AnyCancellable?
    private var toastHideTask: DispatchWorkItem? // To store the delayed hide task
    
    init() {
        //startTimer()
    }
    
    func startTimer() {
        showToast = true

        // Timer will trigger every 3 seconds (this can be adjusted)
        timer = Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.showToast.toggle() // Toggle the toast visibility
                // Hide the toast after 3 seconds
                self.toastHideTask?.cancel() // Cancel any previous task
                self.toastHideTask = DispatchWorkItem {
                    self.showToast.toggle() // Hide toast after 3 seconds
                }
                // Schedule the task to hide the toast after 3 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: self.toastHideTask!)
            }
    }
    
    // Stop the timer and immediately hide the toast
    func stopTimer() {
        timer?.cancel() // Stop the timer from firing
        timer = nil // Clean up the reference to the timer
        showToast = false // Immediately stop showing the toast
        toastHideTask?.cancel() // Cancel the delayed hide task if it exists
    }
}
