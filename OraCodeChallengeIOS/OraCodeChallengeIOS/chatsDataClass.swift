//
//  chatsDataClass.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 3/29/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import Foundation

class chatsDataClass {
    var name:String = ""
    var time:String = ""
    var subject:String = ""
    var message:String = ""
    
    init(name: String, time: String, subject: String, message: String) {
        self.name = name
        self.time = time
        self.subject = subject
        self.message = message
    }
    
    init() {
        
    }
    
    func setName(name: String) {
        self.name = name;
    }
    
    func setTime(time: String) {
        self.time = time;
    }
    
    func setSubject(subject: String) {
        self.subject = subject
    }
    
    func setMessage(message: String) {
        self.message = message;
    }
}
