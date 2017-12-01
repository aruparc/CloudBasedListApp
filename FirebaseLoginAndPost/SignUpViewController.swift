//
//  SignUpViewController.swift
//  FirebaseLoginAndPost
//
//  Created by Arup on 11/30/17.
//  Copyright © 2017 Demos. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var confirmpass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.email.delegate = self
        self.pass.delegate = self
        self.confirmpass.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func createAccount(_ sender: UIButton) {
        if (confirmpass != nil && pass != nil && email != nil){
            
            
            
            Auth.auth().createUser(withEmail: email.text!, password: pass.text!, completion: {(user, error) in
                
                if (user != nil) {
                    
                    print("new user was created!")
                    
                    self.performSegue(withIdentifier: "newUserCreated", sender: self)
                    
                }
                else {
                    print("ERROR: please fill out username, email, password")
                    
                }
                
            })
            
        }

    }
    
    //HIDE keyboard when user touches outside of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //stops the keyboard from showing
    }
    
    //HIDE keyboard when user hits return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        email.resignFirstResponder()
        pass.resignFirstResponder()
        confirmpass.resignFirstResponder()
        
        return (true)
    }
    
    
}
