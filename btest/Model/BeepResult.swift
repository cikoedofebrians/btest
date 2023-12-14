//
//  BeepResult.swift
//  btest
//
//  Created by Ciko Edo Febrian on 04/12/23.
//

import Foundation
import SwiftUI
import SwiftData

enum Result {
    case excellent
    case good
    case aboveAvg
    case avg
    case belowAvg
    case poor
    case veryPoor
    case unknown
    
    func toString() -> String {
        switch self {
        case .excellent:
            return "Excellent"
        case .good:
            return " Good"
        case .aboveAvg:
            return "Above Average"
        case .avg:
            return "Average"
        case .belowAvg:
            return "Below Average"
        case .poor:
            return "Poor"
        case .veryPoor:
            return "Very Poor"
        case .unknown:
            return "Unknown"
        }
    }
    
}
@Model
class BeepResult {
    let stage: Int
    let shuttles: Int
    let distances: Int
    let vo2max: Double
    let date: Date
    
    init(stage: Int, shuttles: Int, distances: Int) {
        self.stage = stage
        self.shuttles = shuttles
        self.distances = distances
        self.vo2max = BeepResult.getVO2MaxResult(stage: stage, shuttles: shuttles)
        self.date = Date()
    }
    
    static func getVO2MaxResult(stage: Int, shuttles: Int) -> Double {
        let stage = Double(stage)
        let shuttles = Double(shuttles)
        print(stage)
        print(shuttles)
        return (3.46 * (stage + (shuttles / ((stage * 0.4325) + 7.00048)))) + 12.2
    }
    func getResult() -> (color: Color, message: String, result: Result){
        guard let age: Int = UserDefaults.standard.object(forKey: "user_age") as? Int else {
            return (.gray, "Oops! 🤔 Age is missing. Please check your profile.", Result.unknown)
        }
        
        for cl in K.beepClassList {
            if (cl.age.contains(age)) {
                return cl.getResult(vo2max: vo2max)
            }
        }
        return (.gray,  "Oops! 🤔 No matching age group found. Please check your profile.", Result.unknown)
    }
    
}
