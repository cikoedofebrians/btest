//
//  Double.swift
//  btest
//
//  Created by Ciko Edo Febrian on 01/11/23.
//

import Foundation


extension Double {
    func toMinuteSecondString() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) - minutes * 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func getEstimatedTime() -> Double {
        return 20 / ((self * 1000) / 3600)
    }
    
    func toString() -> String {
        return "\(self)"
    }
}
