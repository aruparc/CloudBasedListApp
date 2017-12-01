//
//  PostViewController.swift
//  FirebaseLoginAndPost
//
//  Created by Arup on 11/30/17.
//  Copyright © 2017 Demos. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class PostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var writesomething: UITextView!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.writesomething.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func writePost(_ sender: UIBarButtonItem) {
        ref = Database.database().reference()
        
        if (writesomething.text != "") {
            ref.child("posts").childByAutoId().setValue(writesomething.text)
            
                self.performSegue(withIdentifier: "afterPost", sender: self)
        }
        
    }
    
    

    //HIDE keyboard when user touches outside of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //stops the keyboard from showing
    }
    
    //HIDE keyboard when user hits return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        writesomething.resignFirstResponder()

        
        return (true)
    }

}
