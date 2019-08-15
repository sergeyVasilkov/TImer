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

    
    var timerIsWorkingNow=false
    var results:[String]=[]
 
    var  timeInSeconds:TimeInterval = 0
    var lastCircleTime:TimeInterval = 0
    
    var hours:Int {
        get{
            return   Int(timeInSeconds) / 3600
        }
    }
    var minutes :Int {
        get{
            return Int(timeInSeconds) / 60 % 60
        }
    }
    var seconds :Int {
        get{
         return Int(timeInSeconds)%60
        }
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startStopButton: UIButton!
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
       
        timeInSeconds+=1.0
        timeLabel.text = String(format: " %02d:%02d:%02d", hours, minutes,seconds)
    }
   
    @IBAction func startStopTimer(_ sender: UIButton ){
        if timerIsWorkingNow==true {
            timer.invalidate()
            timerIsWorkingNow=false
            sender.titleLabel?.text="Start"
        }
        else {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector (UpdateTimer), userInfo: nil, repeats: true)
            sender.titleLabel?.text="Stop"
            timerIsWorkingNow=true
        }
        // common modes
        
        
    }
   
    
    @IBAction func resetTimer(_ sender: Any) {
        
        timeInSeconds=0.0
        
        timer.invalidate()
        timerIsWorkingNow=false
        timeLabel.text = String(format: " %02d:%02d,%02d", hours,minutes, seconds)
        
        
    }
   
    
    
    @IBAction func addResult(_ sender: Any) {
     
        results.append(timeLabel.text!)
        self.resultsTableView.reloadData()
        resetTimer(self)
        timerIsWorkingNow=false
        startStopTimer(startStopButton)
        
    }
}

