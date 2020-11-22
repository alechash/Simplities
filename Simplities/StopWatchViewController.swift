//
//  StopWatchViewController.swift
//  Stop Watch
//
//  Created by Jude Wilson on 11/20/20.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    var timer = Timer()
    var (hours, minutes, seconds, milliseconds) = (0, 0, 0, 0)

    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func stopTap(_ sender: Any) {
        timer.invalidate()
        startButton.isEnabled = true
    }
    
    @IBAction func resetTap(_ sender: Any) {
        timer.invalidate()
        (hours, minutes, seconds, milliseconds) = (0, 0, 0, 0)
        timerLabel.text = "00:00:00.00"
        startButton.isEnabled = true
    }
    
    @IBAction func startTap(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(StopWatchViewController.keepTimer), userInfo: nil, repeats: true)
        startButton.isEnabled = false
    }
    
    
    @objc func keepTimer() {
        milliseconds += 1
        
        if(milliseconds > 99) {seconds += 1;milliseconds = 0}
        if(seconds == 60) {minutes += 1;seconds = 0}
        if(minutes == 60) {hours += 1;minutes = 0}
        
        let stringSeconds = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let stringMinutes = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        let stringHours = hours > 9 ? "\(hours)" : "0\(hours)"
        let stringMilliseconds = milliseconds > 9 ? "\(milliseconds)" : "0\(milliseconds)"

        timerLabel.text = "\(stringHours):\(stringMinutes):\(stringSeconds).\(stringMilliseconds)"
    }
}

