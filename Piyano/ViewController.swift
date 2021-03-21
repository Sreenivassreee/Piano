//
//  ViewController.swift
//  Piyano
//
//  Created by Sreenivas k on 21/03/21.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        playSound(sound: sender.currentTitle!)
    }
    
   
    func playSound(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

