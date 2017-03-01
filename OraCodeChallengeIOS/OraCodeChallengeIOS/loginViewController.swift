//
//  MainMenuViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Chris Samp on 1/5/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    let loginIdentifier = "Login"
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        if(usernameTextField.text != "" || passwordTextField.text != ""){
            
            performSegue(withIdentifier: loginIdentifier, sender: self)
        }
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        if(usernameTextField.text != "" || passwordTextField.text != ""){
            
            performSegue(withIdentifier: loginIdentifier, sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("made it to viewDidLoad")
    }

    
    
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == loginIdentifier){
            let destination = segue.destination as! MainMenuViewController
            destination.username = usernameTextField.text
            destination.password = passwordTextField.text
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
