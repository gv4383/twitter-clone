//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Greg Vargas on 9/19/19.
//  Copyright © 2019 SkwerlHub. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
        let goyoUser = User(name: "Goyo Var", username: "@goyoyo", bioText: "Good hello my doggies! I'm learning Swift to make iOS apps and it's hard, but also kinda fun actually.", profileImage: UIImage(named: "profile_image")!)
        
        let tokaseUser = User(name: "Tokase Gokulo", username: "@tokagoku", bioText: "Tokase Gokulo is an iOS developer and tweets on topics related to iOS, software, and gaming. Check out our conference!", profileImage: UIImage(named: "other_image")!)
        
        let crocsUser = User(name: "Crocs Lover", username: "@crocs4lyfe", bioText: "Crocks ROCK. I absolutely love wearing crocs. Hot outside? Easy ventilation. Cold outside? Just wear some socks underneath. Going to a party? What better way to impress the crowd then to wear your crocs! I CANNOT express how much these things have changed my life... SERIOUSLY. GET. SOME. CROCS. NOW.", profileImage: UIImage(named: "other_image")!)
        
        return [tokaseUser, goyoUser, crocsUser]
    }()
    
    let tweets = ["tweet1", "tweet2"]
    
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
