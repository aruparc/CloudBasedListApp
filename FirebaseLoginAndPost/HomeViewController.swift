//
//  HomeViewController.swift
//  FirebaseLoginAndPost
//
//  Created by Arup on 11/30/17.
//  Copyright © 2017 Demos. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var allPosts: UITableView!
    var myList:[String] = []
    
    var ref: DatabaseReference!
    var  handle:DatabaseHandle!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        handle = ref.child("posts").observe(.childAdded, with: {(snapshot) in
        
            if let item = snapshot.value as? String {
                
                self.myList.append(item)
                self.allPosts.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = myList[indexPath.row]
        return cell
        
    }
    
    
    @IBAction func logoutUser(_ sender: Any) {
        
        do {  try Auth.auth().signOut()
            
        }
        catch {
            
        }
        
        self.performSegue(withIdentifier: "signedOut", sender: self)
    }
}
