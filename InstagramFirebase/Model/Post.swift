//
//  Post.swift
//  InstagramFirebase
//
//  Created by Vincent on 28/02/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

struct Post {
    let imageUrl: String
    
    init(dictionary: [String: Any]) {
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
    }
}
