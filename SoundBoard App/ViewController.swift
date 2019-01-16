//
//  ViewController.swift
//  SoundBoard App
//
//  Created by Zixuan Kang on 11/28/18.
//  Copyright © 2018 Zixuan Kang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let soundFileNames:[String] = ["imperial_march","rebel-theme","star-wars-cantina-song","star-wars-theme-song"]
    var audioPlayers:[AVAudioPlayer] = [AVAudioPlayer]()
    var audioPlayer:AVAudioPlayer!
    var time:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAudioPlayerList()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        audioPlayer = audioPlayers[sender.tag]
        for audio in audioPlayers {
            audio.stop()
            audio.currentTime = 0
        }
        audioPlayer.play()
    }
    
    @IBAction func playButton(_ sender: Any) {
        audioPlayer.play()
        print("Played")
    }

    @IBAction func pauseButton(_ sender: Any) {
        time = audioPlayer.currentTime
        audioPlayer.pause()
        print("Paused")
    }
    
    @IBAction func stopButton(_ sender: Any) {
        for audio in audioPlayers {
            audio.stop()
            audio.currentTime = 0
            print("Stopped")
        }
    }
    
    func createAudioPlayerList() {
        for sound in soundFileNames {
            do{
                let url = URL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType:"mp3")!)
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayers.append(audioPlayer)
            }
            catch{
                audioPlayers.append(AVAudioPlayer())
            }
        }
    }
}

