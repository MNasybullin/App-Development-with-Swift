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
        // Do any additional setup after loading the view.
    }


}

