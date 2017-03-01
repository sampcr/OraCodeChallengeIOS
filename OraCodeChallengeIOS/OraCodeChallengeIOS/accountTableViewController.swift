//
//  accountTableViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 2/28/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit

struct cellData{
    var label : String;
    var text : String;
}

class accountTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = [cellData] ();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        data = [cellData(label: "Name", text: ""),
                cellData(label: "Email", text: ""),
                cellData(label: "Password", text: ""),
                cellData(label: "Confirm", text: "")];
        print("loaded table view");
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCellText", owner: self, options: nil)?.first as! TableViewCellText;
        
        cell.
        
        
        
        
    }
}
