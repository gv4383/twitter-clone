//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Greg Vargas on 9/19/19.
//  Copyright © 2019 SkwerlHub. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        var users = [User]()
        
        let array = json["users"].array
        
        for userJson in array! {
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        
        self.users = users
    }
    
    let tweets: [Tweet] = {
        let goyoUser = User(name: "Goyo Var", username: "@goyoyo", bioText: "Good hello my doggies! I'm learning Swift to make iOS apps and it's hard, but also kinda fun actually.", profileImage: UIImage(named: "profile_image")!)
        
        let tweet1 = Tweet(user: goyoUser, message: "Hello twitter fam! Just updating you guys on how great of a day it is to be learning some code. I really need a long text block to render out so we're going to stop here.")
        let tweet2 = Tweet(user: goyoUser, message: "Is it bad to tweet 2 times in a row? Oh well, I'm gonna do it anyway...")
        
        return [tweet1, tweet2]
    }()
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        
        return users.count
    }
}
