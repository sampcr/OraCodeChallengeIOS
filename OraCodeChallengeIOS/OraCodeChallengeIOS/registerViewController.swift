//
//  registerViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 3/1/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit

//
//  accountTableViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 2/28/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit


class registerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = [cellData] ();
    var textCells = [TableViewCellText]();
    var passCells = [TableViewCellPass]();
    var completed = true;
    
    var username : String!
    var password : String!
    
    
    @IBAction func loginButton(_ sender: Any) {
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        print("in regButtonClicked")
        for oneCell in textCells {
            if(oneCell.cellText.text == ""){
                completed = false;
                break;
            }
        }
        
        for oneCell in passCells {
            if(oneCell.cellText.text == ""){
                completed = false;
                break;
            }
        }
        
        if(completed){
            if(passCells[0].cellText.text != passCells[1].cellText.text){
                showAlert(type: 1)
            } else {
            let url = URL(string: "https://private-93240c-oracodechallenge.apiary-mock.com/users")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer BBJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9", forHTTPHeaderField: "Authorization")
            
            request.httpBody = "{\n  \"name\": \(textCells[0].cellText.text)\",\n  \"email\": \(textCells[1].cellText.text)\",\n  \"password\": \(passCells[0].cellText.text)\",\n  \"password_confirmation\": \(passCells[1].cellText.text)\"\n}".data(using: .utf8)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let response = response, let data = data {
                    print(response)
                    print(String(data: data, encoding: .utf8))
                    
                } else {
                    print(error)
                }
            }
            self.showAlert(type : 2)
            task.resume()
            }
        } else{
            showAlert(type : 0);
            completed = true;
        }
    }

    
    @IBOutlet weak var alertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        data = [cellData(type: 1,label: "Name", text: ""),
                cellData(type: 1,label: "Email", text: ""),
                cellData(type: 2,label: "Password", text: ""),
                cellData(type: 2,label: "Confirm", text: "")];
        
        print("loaded table view");
        
    }
    
    func showAlert(type : Int) {
        if(type == 0){
            alertLabel.text = "Please fill out entire form before submitting"
        } else if(type == 1) {
            alertLabel.text = "Passwords do not match"
        } else {
            alertLabel.text = "Registered!"
        }
        alertLabel.isHidden = false;
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: false)
    }
    
    func dismissAlert(){
        if alertLabel != nil {
            alertLabel.isHidden = true;
        }
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(data[indexPath.row].type == 1){
            let cell = Bundle.main.loadNibNamed("TableViewCellText", owner: self, options: nil)?.first as! TableViewCellText;
            
            cell.cellLabel.text = data[indexPath.row].label;
            if(data[indexPath.row].label == "Name"){
                cell.cellText.text = username;
            }else {
                cell.cellText.text = data[indexPath.row].text;

            }
            textCells.append(cell);
            
            
            return cell;
        } else if(data[indexPath.row].type == 2){
            let cell = Bundle.main.loadNibNamed("TableViewCellPass", owner: self, options: nil)?.first as! TableViewCellPass;
            
            cell.cellLabel.text = data[indexPath.row].label;
            if(data[indexPath.row].label == "Password"){
                cell.cellText.text = password;

            }else {
                cell.cellText.text = data[indexPath.row].text;

            }
            passCells.append(cell);
            
            
            
            return cell;
        } else {
            let cell = Bundle.main.loadNibNamed("TableViewCellText", owner: self, options: nil)?.first as! TableViewCellText;
            
            cell.cellLabel.text = data[indexPath.row].label;
            cell.cellText.text = data[indexPath.row].text;
            textCells.append(cell);
            
            
            return cell;
        }
        
    }
}

