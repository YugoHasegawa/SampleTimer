//
//  SoundPlayer.swift
//  SampleTimer
//
//  Created by 長谷川 雄吾 on 2024/12/04.
//

import UIKit
import AVFoundation

class SoundPlayer {
    var name: String
    var duration: TimeInterval
    private var player: AVAudioPlayer?
    
    init(name: String, duration: TimeInterval) {
        self.name = name
        self.duration = duration
    }
    
    private func isInSilentMode() -> Bool {
        let audioSession = AVAudioSession.sharedInstance()
        if audioSession.outputVolume == 0 {
            return true
        }
        
        do {
            try audioSession.setActive(true)
            let soundID: SystemSoundID = 1104
            AudioServicesPlaySystemSound(soundID)
            return true
        } catch {
            return false
        }
    }
    
    func play() {
        if isInSilentMode() {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            return;
        }
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.ambient, mode: .default, options: [])
            try audioSession.setActive(true)
        } catch {
            print("Error setting AVAudioSession: \(error)")
        }
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3")
            else {
                print("sound file not found")
                return
            }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
        player?.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.player?.stop()
        }
    }
}
