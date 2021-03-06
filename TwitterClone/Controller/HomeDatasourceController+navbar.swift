//
//  HomeDatasourceController+navbar.swift
//  TwitterClone
//
//  Created by Greg Vargas on 9/21/19.
//  Copyright © 2019 SkwerlHub. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    func setupNavigationBarItems() {
        setupLeftNavItems()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        let titleImageView = UIImageView(image: UIImage(named: "logo")?.withRenderingMode(.alwaysTemplate))
        titleImageView.tintColor = twitterBlue
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    private func setupLeftNavItems() {
        let followButton = UIButton(type: .system)
        followButton.setImage(UIImage(named: "follow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        followButton.tintColor = twitterBlue
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), for: .normal)
        searchButton.tintColor = twitterBlue
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(UIImage(named: "compose")?.withRenderingMode(.alwaysTemplate), for: .normal)
        composeButton.tintColor = twitterBlue
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
}
