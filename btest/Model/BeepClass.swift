//
//  BeepChart.swift
//  btest
//
//  Created by Ciko Edo Febrian on 04/12/23.
//

import SwiftUI

struct BeepClass : Identifiable {
    let id: String
    let age: ClosedRange<Int>
    let excellentRange: ClosedRange<Double>
    let good: ClosedRange<Double>
    let aboveAverage: ClosedRange<Double>
    let average: ClosedRange<Double>
    let belowAverage: ClosedRange<Double>
    let poor: ClosedRange<Double>
    let veryPoor: ClosedRange<Double>
    
    init(age: ClosedRange<Int>, excellentRange: ClosedRange<Double>, good: ClosedRange<Double>, aboveAverage: ClosedRange<Double>, average: ClosedRange<Double>, belowAverage: ClosedRange<Double>, poor: ClosedRange<Double>, veryPoor: ClosedRange<Double>) {
        self.id = UUID().uuidString
        self.age = age
        self.excellentRange = excellentRange
        self.good = good
        self.aboveAverage = aboveAverage
        self.average = average
        self.belowAverage = belowAverage
        self.poor = poor
        self.veryPoor = veryPoor
    }
    
    func getResult(vo2max: Double) -> (color: Color, message: String, result: Result) {
        if excellentRange.contains(vo2max) {
            return (.green, "Wow! 🌟 You're in excellent shape!", Result.excellent)
        } else if good.contains(vo2max) {
            return (.purple, "Nice! 💯 Been in the gym huh? Yo're fitness level is good!", Result.good)
        } else if aboveAverage.contains(vo2max) {
            return (.blue, "Great job! 💪 You're above average!", Result.aboveAvg)
        } else if average.contains(vo2max) {
            return (.yellow, "Nice work! 👏 You're doing well!", Result.avg)
        } else if belowAverage.contains(vo2max) {
            return (.orange, "Keep it up! 🚀 You're below average but improving!", Result.belowAvg)
        } else if poor.contains(vo2max) {
            return (.red, "Let's improve together! 🏋️ Your fitness level is poor.", Result.poor)
        } else if veryPoor.contains(vo2max) {
            return (.purple, "It's never too late to start! 🚴 Your fitness level is very poor.", Result.poor)
        } else {
            return (.gray, "Oops! 🤔 Invalid VO2max value. Please check again.", Result.unknown)
        }
    }
}
