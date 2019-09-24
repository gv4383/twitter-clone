//
//  Tweet.swift
//  TwitterClone
//
//  Created by Greg Vargas on 9/22/19.
//  Copyright © 2019 SkwerlHub. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
