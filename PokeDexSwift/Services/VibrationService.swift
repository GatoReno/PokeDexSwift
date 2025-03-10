//
//  VibrationService.swift
//  PokeDexSwift
//
//  Created by ed on 09/03/25.
//

import Foundation
import UIKit

class VibrationService : VibrationProtocol
{
    func triggerVibration() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
    }
    
    
}
