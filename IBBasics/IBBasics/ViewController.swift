//
//  ViewController.swift
//  IBBasics
//
//  Created by Stomach Diego on 10/17/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("The button was pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.setTitleColor(.red, for: .normal)
        
        myButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
    }

    @IBAction func switchOn(_ sender: UISwitch) {
        if sender.isOn {
            print("Is on")
        } else {
            print("In off")
        }
    }
    
    @IBAction func sliderSlide(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func textChange(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    
    
    
}

