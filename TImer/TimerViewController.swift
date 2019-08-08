//
//  TimerViewController.swift
//  TImer
//
//  Created by Сергей on 08/08/2019.
//  Copyright © 2019 Сергей. All rights reserved.
//

import UIKit

class TimerViewController: UIStackView {
    
    private var numbers=[UITextField]()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setupNumbers()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setupNumbers()
    }
    
    
    private func setupNumbers() {
        for i in 0..<3 {
        var time=UITextField()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        time.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        time.sizeToFit()
        time.insertText("10")
        
        addArrangedSubview(time)
            numbers.append(time)
        }
    }
}
