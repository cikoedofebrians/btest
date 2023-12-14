//
//  Constant.swift
//  btest
//
//  Created by Ciko Edo Febrian on 01/11/23.
//

import Foundation


class K {
    public static let sound = SoundsAsset()
    public static let beepDescription = "The beep test, also known as the shuttle run or multi-stage fitness test, is a popular fitness assessment method. Participants run back and forth between two points, usually 20 meters apart, synchronized with audio beeps. The beeps are spaced apart, and as the test progresses, the time between beeps decreases. This progression requires participants to increase their running speed, providing a comprehensive measure of aerobic capacity, endurance, and cardiovascular fitness. It's an effective tool for tracking and improving overall fitness levels."
    
    public static let tutorialSteps: KeyValuePairs<String, String> = [
        "Setup": "Choose a flat and clear 20-meter distance for the shuttle run. Ensure you have a device with the beep test audio prompts.",
        "Warm-up": "Begin with a thorough warm-up to prevent injuries. Include dynamic stretches and light jogging.",
        "Starting Position": "Position yourself at one end of the 20-meter distance, ready to run.",
        "Beep Synchronization": "Start the beep test app and synchronize your movements with the audio prompts. Begin running when you hear a beep.",
        "Shuttle Runs": "Run back and forth between the two points, reaching each end before the next beep. Maintain a steady pace.",
        "Progression": "As the test continues, the time between beeps decreases. Adjust your speed to match the changing pace.",
        "Endurance Levels": "The test concludes when you can no longer maintain the required pace or reach the designated marker before the beep. Note the level achieved.",
        "Tracking Improvement": "Regularly repeat the beep test and track your progress by reaching higher levels. Use the results to gauge improvements in aerobic fitness over time."
    ]
    
    public static let beepClassList: [BeepClass] = [
        BeepClass(age: 18...25,
                  excellentRange: 61...Double.infinity,
                  good: 52...60,
                  aboveAverage: 47...51,
                  average: 42...46,
                  belowAverage: 37...41, 
                  poor: 30...36, 
                  veryPoor: 0...29),
        BeepClass(age: 26...35,
                  excellentRange: 57...Double.infinity,
                  good: 49...56,
                  aboveAverage: 43...48,
                  average: 40...42,
                  belowAverage: 35...39,
                  poor: 30...34,
                  veryPoor: 0...29),
        BeepClass(age: 36...45,
                  excellentRange: 52...Double.infinity,
                  good: 43...51,
                  aboveAverage: 39...42,
                  average: 35...38,
                  belowAverage: 31...34,
                  poor: 26...30,
                  veryPoor: 0...25),
        BeepClass(age: 46...55,
                  excellentRange: 46...Double.infinity,
                  good: 39...45,
                  aboveAverage: 36...38,
                  average: 32...35,
                  belowAverage: 29...31,
                  poor: 25...28,
                  veryPoor: 0...29),
        BeepClass(age: 56...65,
                  excellentRange: 42...Double.infinity,
                  good: 36...41,
                  aboveAverage: 32...35,
                  average: 30...31,
                  belowAverage: 26...29,
                  poor: 22...25,
                  veryPoor: 0...21),
        BeepClass(age: 66...100,
                  excellentRange: 38...Double.infinity,
                  good: 33...37,
                  aboveAverage: 29...32,
                  average: 26...28,
                  belowAverage: 22...25,
                  poor: 20...21,
                  veryPoor: 0...19)
    ]
    
    public static let beepStagesList =
    [
        BeepStage(stage: 1, shuttles: 7, speed: 8),
        BeepStage(stage: 2, shuttles: 8, speed: 9),
        BeepStage(stage: 3, shuttles: 8, speed: 9.5),
        BeepStage(stage: 4, shuttles: 9, speed: 10),
        BeepStage(stage: 5, shuttles: 9, speed: 10.5),
        BeepStage(stage: 6, shuttles: 10, speed: 11),
        BeepStage(stage: 7, shuttles: 10, speed: 11.5),
        BeepStage(stage: 8, shuttles: 11, speed: 12),
        BeepStage(stage: 9, shuttles: 11, speed: 12.5),
        BeepStage(stage: 10, shuttles: 11, speed: 13),
        BeepStage(stage: 11, shuttles: 12, speed: 13.5),
        BeepStage(stage: 12, shuttles: 12, speed: 14),
        BeepStage(stage: 13, shuttles: 13, speed: 14.5),
        BeepStage(stage: 14, shuttles: 13, speed: 15),
        BeepStage(stage: 15, shuttles: 13, speed: 15.5),
        BeepStage(stage: 16, shuttles: 14, speed: 16),
        BeepStage(stage: 17, shuttles: 14, speed: 16.5),
        BeepStage(stage: 18, shuttles: 15, speed: 17),
        BeepStage(stage: 19, shuttles: 15, speed: 17.5),
        BeepStage(stage: 20, shuttles: 16, speed: 18),
        BeepStage(stage: 21, shuttles: 16, speed: 18.5),
    ]
}

class SoundsAsset {
    let beep01 = "beep-01";
    let beep02 = "beep-02";
}
