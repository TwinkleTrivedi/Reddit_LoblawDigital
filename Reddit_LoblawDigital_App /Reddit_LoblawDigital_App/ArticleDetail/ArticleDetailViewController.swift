//
//  ArticleDetailViewController.swift
//  Reddit_LoblawDigital_App
//
//  Created by Twinkle Trivedi on 2020-10-01.
//  Copyright © 2020 Twinkle Trivedi. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
   
    var A_title=""
    var author=""
    var thumbnail=""
    var A_body=""
    
    @IBOutlet weak var thumbnailimg: UIImageView!
    
    @IBOutlet weak var AbodyText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AbodyText.text="\(A_body) -\n\n Posted By : \(author)"
        
        let urlimg = URL(string: thumbnail)
        DispatchQueue.global(qos: .background).async {
            let data = try? Data(contentsOf: urlimg!)
            DispatchQueue.main.async {
                if let imageData = data {
                    
                    self.thumbnailimg.image=UIImage(data: imageData)
                }
                else
                {
                    self.thumbnailimg.image=UIImage(named: "back")!
                }
                
            }
        }
        
        
    }
    
    
    
    
}
