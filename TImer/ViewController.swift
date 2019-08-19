//
//  ViewController.swift
//  TImer
//
//  Created by Сергей on 08/08/2019.
//  Copyright © 2019 Сергей. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resultsTableView: UITableView!
    
    var timer: Timer?
    var results = [String]()

    var startTime: TimeInterval = 0
    var elapsedTime: TimeInterval = 0
    var circleTime: TimeInterval = 0
    
    var currentTime: TimeInterval {
        get {
            return Date().timeIntervalSince1970 - startTime + elapsedTime
        }
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = results[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultsTableView.backgroundColor = UIColor.darkGray
        // Do any additional setup after loading the view.
    }
    
    @objc func updateTimer() {
        timeLabel.text = currentTime.timeString
    }
    
    @IBAction func startStopTimer(_ sender: UIButton) {
        if timer != nil {
            elapsedTime += Date().timeIntervalSince1970 - startTime
            timer?.invalidate()
            timer = nil
        } else {
            startTime = Date().timeIntervalSince1970
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] _ in
                self?.updateTimer()
            })
        }
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        elapsedTime = 0
        
        timeLabel.text = "00:00:00"
        results = []
        resultsTableView.reloadData()
    }
    
    @IBAction func addResult(_ sender: Any) {
        let cTime = currentTime
        let time = cTime - circleTime
        circleTime = cTime
        
        results.append(time.timeString)
        resultsTableView.reloadData()
    }
}

