//
//  SoundManager.swift
//  btest
//
//  Created by Ciko Edo Febrian on 02/12/23.
//

import Foundation
import AVKit

class SoundManager {
    static let shared = SoundManager()

    init () {}
    
    var player: AVAudioPlayer?
    
    func playSound(assetName: String) {
        
        guard let url = Bundle.main.url(forResource: assetName, withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        }catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }

    }
    
}
