//
//  UserDataClass.swift
//  OraCodeChallengeIOS
//
//  Created by Christopher Samp on 3/18/17.
//  Copyright © 2017 OraCode. All rights reserved.
//

import Foundation

class UserDataClass {
    var user:String = "";
    var pass:String = "";
    
    init(user:String, pass:String) {
        self.user = user;
        self.pass = pass;
    }
    
    init() {
        
    }
    
    func setUser(user:String) {
        self.user = user;
    }
    
    func setPass(pass:String) {
        self.pass = pass;
    }
    
    func getUser() -> String {
        return self.user;
    }
    
    func getPass() -> String {
        return self.pass;
    }
}
