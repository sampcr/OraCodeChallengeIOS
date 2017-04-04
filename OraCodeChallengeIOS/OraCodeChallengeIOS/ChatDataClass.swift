//
//  ChatDataClass.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 4/3/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import Foundation

class chatDataClass {
    var message:[String] = []
    
    init(message: String) {
        
        self.message.append(message)
    }
    
    init() {
        
    }
    
    func setMessage(message: String) {
        self.message.append(message)
    }
}
