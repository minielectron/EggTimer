//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let hardness = ["Soft": 30, "Hard": 50, "Medium":40]
    var timer = Timer()
    var remainingSeconds: Int = 0
    var selectedHardness: Int = 0
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let title = sender.currentTitle!
        selectedHardness = hardness[title]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onHardnessSelected), userInfo: self, repeats: true)
        remainingSeconds = selectedHardness
    }
    
    @objc func onHardnessSelected(){
        if remainingSeconds > 0{
            print(remainingSeconds)
            remainingSeconds -= 1
            progressView.progress = Float((selectedHardness - remainingSeconds)) / Float(selectedHardness)
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    
    
}
