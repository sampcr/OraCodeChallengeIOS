//
//  MainMenuViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Chris Samp on 1/5/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit
import Foundation


class loginViewController: UIViewController {
    @IBOutlet weak var alertLabel: UILabel!
    
    let loginIdentifier = "Login"
    let registerIdentifier = "Register"
    var username = "";
    var useremail = "";
    var password = "";
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        getName(email: usernameTextField.text!, password: passwordTextField.text!)
        print(self.useremail)
        print(usernameTextField.text)
        sleep(1);
        if(self.useremail == usernameTextField.text){
            password = passwordTextField.text!
            performSegue(withIdentifier: loginIdentifier, sender: self)
        } else {
            alertLabel.isHidden = false
        }
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        performSegue(withIdentifier: registerIdentifier, sender: self)
    }
    
    
    func getName(email: String, password: String){
        let url = URL(string: "https://private-93240c-oracodechallenge.apiary-mock.com/auth/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        print("{\n  \"email\": \(email)\",\n  \"password\": \"secret\"\n}")
        request.httpBody = "{\n  \"email\": \(email)\",\n  \"password\": \"secret\"\n}".data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response, let data = data {
                print(response)
                print(String(data: data, encoding: .utf8))
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                if let dictionary = json as? [String:Any] {
                    
                    
                    if let nestedDictionary = dictionary["data"] as? [String: Any] {
                        // access nested dictionary values by key
                        let name = nestedDictionary["name"] as? String
                        self.username = name!
                        print(name)
                        let email = nestedDictionary["email"] as? String
                        self.useremail = email!
                        print(email)
                    }
                }

            } else {
                print(error)
            }
        }
        
        task.resume()
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
            destination.name = usernameTextField.text
            destination.password = passwordTextField.text
            destination.email = self.useremail
        } else {
            let destination = segue.destination as! registerViewController
            destination.username = usernameTextField.text
            destination.password = passwordTextField.text
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
