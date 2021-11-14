//
//  SoundManager.swift
//  MatchingPictureApp
//
//  Created by Paweł Brzozowski on 14/11/2021.
//

import Foundation
import AVFoundation

class SoundManager {
    var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case match
        case nomach
        case shuffle
    }
    // This function have enum as paramter
    func plasySound(effect:SoundEffect) {
        
        var soundFileName = ""
        
        switch effect {
            case .flip:
                soundFileName = "cardflip"
            case .match:
                soundFileName = "dingcorrect"
            case .nomach:
                soundFileName = "dingwrong"
            case .shuffle:
                soundFileName = "shuffle"
        }
        
        // Creating path to resoursce
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: ".wav")
        
        // Chechk if path is not nil. Make sur its not nil otherwise return.
        guard bundlePath != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        // How to take care of throw block
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            audioPlayer?.play()
        } catch {
            return
        }
        
    }
}
