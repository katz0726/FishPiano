//
//  SEManager.swift
//  FishPiano
//
//  Created by shoya on 2024/03/23.
//

import UIKit
import AVFoundation

class SEManager:NSObject, AVAudioPlayerDelegate {
    static let shared = SEManager()
    var sePool = [AVAudioPlayer]()

    func play(fileName: String) {
        let url = URL(fileURLWithPath: Bundle.main.bundlePath).appendingPathComponent(fileName)
        let player: AVAudioPlayer!

        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            player.delegate = self
            sePool.append(player)
            player.play()
        } catch {
            print("Failed to create AVAudioPlayer.")
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let index = sePool.firstIndex(of: player) {
            sePool.remove(at: index)
        }
    }
}
