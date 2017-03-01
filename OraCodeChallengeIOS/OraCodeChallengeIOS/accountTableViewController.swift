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
    
    override func viewDidLoad() {
        super.viewDidLoad();
        data = [cellData(type: 1,label: "Name", text: ""),
                cellData(type: 1,label: "Email", text: ""),
                cellData(type: 2,label: "Password", text: ""),
                cellData(type: 2,label: "Confirm", text: "")];
        print("loaded table view");
        
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
            
            return cell;
        } else if(data[indexPath.row].type == 2){
            let cell = Bundle.main.loadNibNamed("TableViewCellPass", owner: self, options: nil)?.first as! TableViewCellPass;
            
            cell.cellLabel.text = data[indexPath.row].label;
            cell.cellText.text = data[indexPath.row].text;
            
            return cell;
        } else {
            let cell = Bundle.main.loadNibNamed("TableViewCellText", owner: self, options: nil)?.first as! TableViewCellText;
            
            cell.cellLabel.text = data[indexPath.row].label;
            cell.cellText.text = data[indexPath.row].text;
            
            return cell;

        }
        
        
        
        
        
    }
}
