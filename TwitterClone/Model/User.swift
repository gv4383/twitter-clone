//
//  User.swift
//  TwitterClone
//
//  Created by Greg Vargas on 9/21/19.
//  Copyright © 2019 SkwerlHub. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

struct User: JSONDecodable {
    let name: String
    let username: String
    let bioText: String
    let profileImageUrl: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
