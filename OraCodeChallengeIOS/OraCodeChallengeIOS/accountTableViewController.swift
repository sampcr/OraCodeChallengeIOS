//
//  accountTableViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 2/28/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit

struct cellData{
    var type: Int;
    var label : String;
    var text : String;
}

class accountTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = [cellData] ();
    var textCells = [TableViewCellText]();
    var passCells = [TableViewCellPass]();
    var completed = true;
    var name : String = ""
    var email: String = ""
    var password: String = ""
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var alertLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        data = [cellData(type: 1,label: "Name", text: name),
                cellData(type: 1,label: "Email", text: email),
                cellData(type: 2,label: "Password", text: password),
                cellData(type: 2,label: "Confirm", text: "")];
        
        print("loaded table view");
        
    }
    
    func showAlert() {
        alertLabel.isHidden = false;
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: false)
    }
    
    func dismissAlert(){
        if alertLabel != nil {
            alertLabel.isHidden = true;
        }
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
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
            //add stuff to database
        } else{
            showAlert();
            completed = true;
        }
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
            cell.cellText.text = data[indexPath.row].text;
            textCells.append(cell);

            
            return cell;
        } else if(data[indexPath.row].type == 2){
            let cell = Bundle.main.loadNibNamed("TableViewCellPass", owner: self, options: nil)?.first as! TableViewCellPass;
            
            cell.cellLabel.text = data[indexPath.row].label;
            cell.cellText.text = data[indexPath.row].text;
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
