//
//  ViewController.swift
//  Login
//
//  Created by Stomach Diego on 10/25/20.
//  Copyright © 2020 Mansur Nasybullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var forgotUserNameButton: UIButton!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUserNameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = userNameTextField.text
        }
    }
    
    @IBAction func forgotUserName(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUserNameOrPassword", sender: forgotUserNameButton)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUserNameOrPassword", sender: forgotPasswordButton)
    }
    
}

