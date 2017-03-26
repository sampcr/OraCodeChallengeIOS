//
//  chatCollectionViewController.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 3/25/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class chatCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! chatCell
        
//        if let chatText: String = "this is the text I am sending you" {
//            
//            cell.messageText.text = chatText;
//            let size = CGSize.init(width: 250, height: 1000)
//            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
//            let estimatedFrame = NSString(string: chatText).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18)], context: nil)
//            
//            cell.messageText.frame = CGRect(x: 48 + 8, y: 0, width: estimatedFrame.width, height: estimatedFrame.height)
        
            
        //}
    
        // Configure the cell
    
        return cell
    }
}

class chatCell: BaseCell {
    
    let messageText: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.text = "this is sample text"
        tv.backgroundColor = UIColor.clear;
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
    }
}


class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
}

