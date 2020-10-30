//
//  ViewController.swift
//  AppEventCount
//
//  Created by Stomach Diego on 10/28/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var launchCount = 0
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    
    var resignActiveCount = 0
    @IBOutlet weak var willResignActiveLabel: UILabel!
    
    var enterBackgroundCount = 0
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    
    var enterForegroundCount = 0
    @IBOutlet weak var willEnterForeground: UILabel!
    
    var becomeActiveCount = 0
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    
    var terminateCount = 0
    @IBOutlet weak var willTerminate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(launchCount) time(s)"
        willResignActiveLabel.text = "will resign active = \(resignActiveCount)"
        didEnterBackgroundLabel.text = "enter background = \(enterBackgroundCount)"
        willEnterForeground.text = "enter foreground = \(enterForegroundCount)"
        didBecomeActiveLabel.text = "become active = \(becomeActiveCount)"
        willTerminate.text = "will terminate =  \(terminateCount)"
        
        
    }


}

