//
//  AudioPlayer.swift
//  Restart
//
//  Created by CP on 29/10/25.
//

import AVFoundation
import Foundation

class AudioPlayer {
    
    static let shared = AudioPlayer()
    
    private var audioPlayer: AVAudioPlayer?
    
    func playSound(title: String, type: String) {
        if let path = Bundle.main.path(forResource: title, ofType: type) {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                self.audioPlayer?.play()
            } catch {
                print("Could not play the audio file - \(title) \(type)")
            }
        }
    }
}

