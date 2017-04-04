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
        let chatVC = chatTableViewController()
        chatVC.getData() {theData in
            self.data = [chatMessageCellData(isSender:true, msg: theData.message[0]),
                    chatMessageCellData(isSender:false, msg: theData.message[1]),
                    chatMessageCellData(isSender:true, msg: theData.message[2]),
                    chatMessageCellData(isSender:false, msg: theData.message[3])]
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }

//        data =
//            [chatMessageCellData(isSender: false, msg: "Hello"),
//             chatMessageCellData(isSender: true, msg: "Hows it going my good sir, you are looking great today")]
    }
    
    func getData(completion:@escaping (chatDataClass) -> ()) {
        let dataClass = chatDataClass()
        let url = URL(string: "https://private-93240c-oracodechallenge.apiary-mock.com/chats/id/chat_messages?page=&limit=")!
        var request = URLRequest(url: url)
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer BBJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response, let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                if let dictionary = json as? [String:Any] {
                    if let metaData = dictionary["meta"] as? [String: Any] {
                        if let pageData = metaData["pagination"] as? [String: Any] {
                            var size:Int = pageData["total_count"] as! Int
                            print("&&&&&&&&&&&&&&")
                            print(size)
                            print("&&&&&&&&&&&&&&")
                        }
                    }
                    if let nestedDictionary = dictionary["data"] as? [[String: Any]] {
                        for element in nestedDictionary {
                            var msg = element["message"] as! String
                            dataClass.setMessage(message: msg)
                        }
                        completion(dataClass)
                    }
                }
            } else {
                print(error)
            }
        }
        
        task.resume()
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
            
            cell.messageText.frame = CGRect(x: view.frame.width - estimatedFrame.width, y: 0, width: estimatedFrame.width, height: estimatedFrame.height+30)
            
            cell.bubble.frame = CGRect(x: view.frame.width - estimatedFrame.width - 8, y: 0, width: estimatedFrame.width+4, height: estimatedFrame.height + 30)
        } else {
            
            cell.messageText.frame = CGRect(x:4.0, y: 0, width: estimatedFrame.width + 8, height: estimatedFrame.height+30)
            
            cell.bubble.frame = CGRect(x: 0, y: 0, width: estimatedFrame.width + 8, height: estimatedFrame.height + 30)

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
