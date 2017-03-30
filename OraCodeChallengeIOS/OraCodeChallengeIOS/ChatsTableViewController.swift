//
//  ChatsTableViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 3/2/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit

struct chatCellData {
    var date : String
    var subject : String
    var personTime : String
    var msg : String
}


class ChatsTableViewController: UITableViewController {
    var data = [chatCellData] ();
    let chatIdentifier = "chat"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let ctvc = ChatsTableViewController()
        ctvc.getData {theData in
            print(theData.message)
            self.data = [chatCellData(date: theData.time, subject: theData.subject, personTime: theData.name, msg: theData.message)]
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        
        
        // tableView.rowHeight = UITableViewAutomaticDimension
        // tableView.estimatedRowHeight = 140
        tableView.rowHeight = 140;
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func getData(completion:@escaping (chatsDataClass) -> ()) {
        let dataClass = chatsDataClass()
        let url = URL(string: "https://private-93240c-oracodechallenge.apiary-mock.com/chats?page=&limit=")!
        var request = URLRequest(url: url)
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer BBJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response, let data = data {
                print("~!!!!")
                //print(String(data: data, encoding: .utf8))
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                if let dictionary = json as? [String:Any] {
                    print("~!~!")
                    print(dictionary)
                    if let nestedDictionary = dictionary["data"] as? [[String: Any]] {
                        print("@@@@")
                        let nestedData = nestedDictionary[0]
                        let subject = nestedData["name"] as! String
                        print(subject)
                        if let lastChat = nestedData["last_chat_message"] as? [String: Any] {
                            let msgDate = lastChat["created_at"] as! String
                            print(msgDate)
                            let message = lastChat["message"] as! String
                            print(message)
                            if let lastUser = lastChat["user"] as? [String: Any] {
                                let name = lastUser["name"] as! String
                                print(name)
                                dataClass.setName(name: name)
                                dataClass.setSubject(subject: subject)
                                dataClass.setTime(time: msgDate)
                                dataClass.setMessage(message: message)
                                completion(dataClass)
                            }
                        }
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
        print("Checking number of rows")
        print(self.data.count)
        return self.data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("chatsCell", owner: self, options: nil)?.first as! chatsCell
        cell.date.text = data[indexPath.row].date;
        cell.message.text = data[indexPath.row].msg;
        cell.nameSubject.text = data[indexPath.row].subject;
        cell.nameTime.text = data[indexPath.row].personTime;
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked on a cell!");
        performSegue(withIdentifier: "chat", sender: self)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == chatIdentifier) {
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
