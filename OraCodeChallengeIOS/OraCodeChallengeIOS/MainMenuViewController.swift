//
//  MainMenuViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Chris Samp on 1/5/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit




class MainMenuViewController: UITabBarController {
    
    var name : String!
    var password : String!
    var email : String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ladedah")
        //var destinationViewController = MainMenuViewController.targetViewController(accountTableViewController) as! accountTableViewController
        //performSegue(withIdentifier: "AccountSegue", sender: self)
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("in prepare")
        let destination = segue.destination as! accountTableViewController
        destination.name = self.name
        destination.password = self.password
        destination.email = self.email
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
