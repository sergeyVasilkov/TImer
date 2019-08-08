//
//  ViewController.swift
//  TImer
//
//  Created by Сергей on 08/08/2019.
//  Copyright © 2019 Сергей. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer=Timer()
    var microSeconds = 0
    var seconds=0
    var minutes=0
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

        @objc func UpdateTimer() {
        microSeconds = microSeconds+1
            if microSeconds==99 {
                seconds+=1
                microSeconds=0
            }
            if seconds==59 {
                minutes+=1
                seconds=0
            }
            timeLabel.text = String(format: " %02d:%02d:%02d", minutes, seconds, microSeconds)
    }
   
    @IBAction func startTimer(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        
    }
    @IBAction func stopTimer(_ sender: Any) {
         timer.invalidate()
    }
    @IBAction func resetTimer(_ sender: Any) {
        
        microSeconds=0
        seconds=0
        minutes=0
        
        timer.invalidate()
        timeLabel.text = String(format: " %02d:%02d:%02d", minutes, seconds, microSeconds)
    }
}

