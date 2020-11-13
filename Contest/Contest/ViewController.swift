//
//  ViewController.swift
//  Contest
//
//  Created by Stomach Diego on 11/13/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendButtonTapped(_ sender: UIButton) {
        if emailTextField.text!.isEmpty {
            UIView.animate(withDuration: 0.2, animations: {
                self.emailTextField.transform = CGAffineTransform(translationX: 25, y: 0)
            }) { (_) in
                self.emailTextField.transform = CGAffineTransform.identity
            }
        } else {
            performSegue(withIdentifier: "SendButtonIdentifier", sender: nil)
        }
    }
    
}

