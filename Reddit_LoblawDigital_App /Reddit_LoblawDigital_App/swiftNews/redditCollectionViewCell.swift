//
//  redditCollectionViewCell.swift
//  Reddit_LoblawDigital_App
//
//  Created by Twinkle Trivedi on 2020-10-01.
//  Copyright © 2020 Twinkle Trivedi. All rights reserved.
//

import UIKit

class redditCollectionViewCell: UICollectionViewCell {
    
       
 @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!

    
    @IBOutlet private var maxWidthConstraint: NSLayoutConstraint! {
        didSet {
            maxWidthConstraint.isActive = false
            
        }
    }
    
    var maxWidth: CGFloat? = nil {
        didSet {
            guard let maxWidth = maxWidth else {
                return
            }
            maxWidthConstraint.isActive = true
            maxWidthConstraint.constant = maxWidth
          
           
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
         contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

}
