//
//  HomeDatasourceController.swift
//  TwitterClone
//
//  Created by Greg Vargas on 9/19/19.
//  Copyright © 2019 SkwerlHub. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies, something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() // LBTA method call
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
        Service.sharedInstance.fetchHomeFeed { (homeDatasource, err) in
            if let err = err {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
                
                return
            }
            
            self.datasource = homeDatasource
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // first section of users
        if indexPath.section == 0 {
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero }
                
            // get estimation of the height
            // of our cellbased on user.bioText
            let estimatedHeight = estimatedHeightForText(user.bioText)
            
            // height = estimated frame height + 20 (name height) + 20 (username height) + 12 (top padding) + extra
            return CGSize(width: view.frame.width, height: estimatedHeight + 66)
        } else if indexPath.section == 1 {
           guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
            
            let estimatedHeight = estimatedHeightForText(tweet.message)
            
            // height = estimated frame height + 20 (name height) + 20 (username height) + 12 (top padding) + extra
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
            
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    private func estimatedHeightForText (_ text: String) -> CGFloat {
        // frame width - 12 (image left padding) - 50 (profile image width) - 8 (image right padding) - 6 (extra spacing)
        let approximateWidthOfBioTextView = view.frame.width - 76
        
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        
        // 15 from bioText font size in UserCell
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
