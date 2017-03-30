//
//  chatTableViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 3/26/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit

struct chatMessageCellData {
    var isSender: Bool
    var msg : String
}

class chatTableViewController: UITableViewController {
    
    var data = [chatMessageCellData] ();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 140
        

        data =
            [chatMessageCellData(isSender: false, msg: "Hello"),
             chatMessageCellData(isSender: true, msg: "Hows it going my good sir, you are looking great today")]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("chatTableViewCell", owner: self, options: nil)?.first as! chatTableViewCell
        cell.messageText.text = data[indexPath.row].msg
        cell.messageText.backgroundColor = UIColor.clear
        cell.messageText.layer.zPosition = 1
        cell.bubble.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.bubble.layer.cornerRadius = 15
        cell.bubble.layer.masksToBounds = true
        
        let size = CGSize(width: 250, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: cell.messageText.text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10)], context: nil)
        
        if (data[indexPath.row].isSender) {
            
            cell.messageText.frame = CGRect(x: view.frame.width - estimatedFrame.width, y: 0, width: estimatedFrame.width + 16 + 8, height: estimatedFrame.height+10)
            
            cell.bubble.frame = CGRect(x: view.frame.width - estimatedFrame.width - 8, y: 0, width: estimatedFrame.width + 8, height: estimatedFrame.height + 10)
        } else {
            
            cell.messageText.frame = CGRect(x:4.0, y: 0, width: estimatedFrame.width + 16 + 8, height: estimatedFrame.height+10)
            
            cell.bubble.frame = CGRect(x: 0, y: 0, width: estimatedFrame.width + 16 + 8, height: estimatedFrame.height + 10)

        }
        // Configure the cell...
        
        return cell
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
