//
//  User.swift
//  InstagramFirebase
//
//  Created by Vincent on 21/04/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

struct User {
    
    let username: String
    let profileImageUrl: String
    
    init(dictionary: [String: Any]) {
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
    
}
