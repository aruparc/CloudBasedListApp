//
//  ViewController.swift
//  FirebaseLoginAndPost
//
//  Created by Arup on 11/29/17.
//  Copyright © 2017 Demos. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailfield: UITextField!
    @IBOutlet weak var passwordfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Necessary definition to hide the keyboard after typing is done
        self.emailfield.delegate = self
        self.passwordfield.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //THIS is the function for the login button -- log the user in if the email/pass exist
    
    @IBAction func loginUser(_ sender: UIButton) {
        if (emailfield.text != "" && passwordfield.text != "") {
            
            Auth.auth().signIn(withEmail: emailfield.text!, password: passwordfield.text!, completion: {(user, error) in
                
                if (user != nil) {
                    //segue to the main app
                    self.performSegue(withIdentifier: "signedIn", sender: self)
                    
                }
                else {
                    print("failed login, user either doesnt exist or password was wrong")
                    
                    
                    
                    let alert = UIAlertController(title: "Login Failed", message: "Either email or password was incorrectly entered. Please try again.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { (action) in
                        
                        alert.dismiss(animated: true, completion: nil)
                        
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                    //print the failed login warning in a label text here if the login fails
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
        emailfield.resignFirstResponder()
        passwordfield.resignFirstResponder()
        
        return (true)
    }

    
}

