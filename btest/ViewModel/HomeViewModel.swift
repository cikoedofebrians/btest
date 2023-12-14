//
//  HomeViewModel.swift
//  btest
//
//  Created by Ciko Edo Febrian on 01/11/23.
//

import Foundation
import SwiftUI
import Combine
import SwiftData


class HomeViewModel: ObservableObject {
    // Cancellable
    private var cancellables: AnyCancellable?
    
    // Animation
    @Published var circleShadowRadius: Bool = false
    @Published var shockBackground: Bool = false
    
    init(context: ModelContext) {
        self.context = context
    }
    // Logic
    let context: ModelContext
    @Published var isStarted: Bool = false
    @Published var secondsLeft: Double = 0
    @Published var currentStage: Int = 0
    @Published var currentStageShuttles: Int = 1
    @Published var countdown: Int? = nil
    @Published var totalDistance: Int = 0
    @Published var showSheet: Bool = false
    @Published var beepResult: BeepResult = BeepResult(stage: 0, shuttles: 1, distances: 0)
    
    
    
    func addShockBackground() {
        withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
            shockBackground.toggle()
        }
    }
    
    func startBeepTest() {
        withAnimation {
            countdown = 1
        }
        cancellables = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink { _ in
                withAnimation {
                    self.countdown? -= 1
                    if (self.countdown == 0) {
                        self.countdown = nil
                        self.isStarted = true
                        self.cancellables?.cancel()
                        self.addAndStartTimer()
                    }
                }
                
            }
    }
    
    func addCircleAnimation() {
        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
            circleShadowRadius.toggle()
            
        }
    }
    
    func addAndStartTimer() {
        secondsLeft = K.beepStagesList[currentStage].speed.getEstimatedTime()
        cancellables = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] timer in
                if (self?.secondsLeft ?? 0.0 == 0) {
                    withAnimation {
                            if (self?.currentStageShuttles == K.beepStagesList[self?.currentStage ?? 0].shuttles) {
                                if(((self?.currentStage ?? 0 ) + 1) == K.beepStagesList.count){
                                    self?.cancelBeepTest()
                                } else {
                                    self?.currentStage += 1
                                    self?.currentStageShuttles = 1
                                    SoundManager.shared.playSound(assetName: K.sound.beep02)
                                    self?.secondsLeft = K.beepStagesList[self?.currentStage ?? 0].speed.getEstimatedTime()
                                }
                            } else {
                                self?.currentStageShuttles += 1
                                SoundManager.shared.playSound(assetName: K.sound.beep01)
                                self?.secondsLeft = K.beepStagesList[self?.currentStage ?? 0].speed.getEstimatedTime()
                            }
                            self?.totalDistance += 20
    
                    }
                    
                } else {
                    withAnimation(.easeIn(duration: 0.1)) {
                        self?.secondsLeft -= 0.1
                        if (self?.secondsLeft ?? 0 <= 0.1) {
                            self?.secondsLeft = 0.0
                        }
                    }
                }
            }
    
    }
    
    
    func cancelBeepTest() {
        currentStageShuttles -= 1
        if (currentStageShuttles == 0 && currentStage != 0){
            currentStage -= 1
            currentStageShuttles = K.beepStagesList[currentStage].shuttles
        }
        beepResult = BeepResult(stage: currentStage + 1, shuttles: currentStageShuttles, distances: totalDistance)
        context.insert(beepResult)
        showSheet.toggle()
        cancellables?.cancel()
        withAnimation(.spring) {
            self.totalDistance = 0
            self.currentStage = 0
            self.currentStageShuttles = 1
            self.secondsLeft = 0.0
            self.isStarted = false
        }
    }
}

