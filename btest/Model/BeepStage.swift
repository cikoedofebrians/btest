//
//  BeepStage.swift
//  btest
//
//  Created by Ciko Edo Febrian on 02/12/23.
//

import Foundation

class BeepStage: Identifiable {
    let id: String
    let stage: Int
    let shuttles: Int
    let speed: Double
    
    init(stage: Int, shuttles: Int, speed: Double) {
        self.id = UUID().uuidString
        self.stage = stage
        self.shuttles = shuttles
        self.speed = speed
    }
}
