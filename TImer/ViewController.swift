//
//  ViewController.swift
//  TImer
//
//  Created by Сергей on 08/08/2019.
//  Copyright © 2019 Сергей. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
  
    var timer=Timer()
    var microSeconds = 0
    var seconds=0
    var minutes=0
    
    var results:[String]=["Helllo"]
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CellIdentifier", for: indexPath)
       cell.textLabel?.text=results[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultsTableView.backgroundColor = UIColor.darkGray
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
        // common modes
        
        
    }
    @IBAction func stopTimer(_ sender: Any) {
         timer.invalidate()
    }
    @IBAction func resetTimer(_ sender: Any) {
        
        microSeconds=0
        seconds=0
        minutes=0
        
        timer.invalidate()
        timeLabel.text = String(format: " %02d:%02d,%02d", minutes, seconds, microSeconds)
        
        
    }
   
    
    
    @IBAction func addResult(_ sender: Any) {
     
        results.append(timeLabel.text!)
        self.resultsTableView.reloadData()
        resetTimer(self)
        startTimer(self)
        
    }
}

