//
//  TimeIntervalExtension.swift
//  TImer
//
//  Created by Сергей on 16/08/2019.
//  Copyright © 2019 Сергей. All rights reserved.
//

import Foundation

extension TimeInterval {
    var hours: Int {
        get {
            return Int(self) / 3600
        }
    }
    
    var minutes: Int {
        get {
            return Int(self) / 60 % 60
        }
    }
    
    var seconds: Int {
        get {
            return Int(self) % 60
        }
    }
    
    var timeString: String {
        get {
            return String(format: "%02d:%02d:%02d", self.hours, self.minutes, self.seconds)
        }
    }
}
