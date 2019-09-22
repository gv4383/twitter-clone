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
        
        let rayUser = User(name: "Tokase Gokulo", username: "@tokagoku", bioText: "Tokase Gokulo is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference!", profileImage: UIImage(named: "other_image")!)
        
        return [goyoUser, rayUser]
    }()
    
//    let words = ["user1", "user2", "user3"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
