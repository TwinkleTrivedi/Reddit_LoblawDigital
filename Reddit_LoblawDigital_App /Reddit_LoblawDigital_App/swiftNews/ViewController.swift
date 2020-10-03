//
//  ViewController.swift
//  Reddit_LoblawDigital_App
//
//  Created by Twinkle Trivedi on 2020-09-30.
//  Copyright © 2020 Twinkle Trivedi. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
  

    @IBOutlet weak var swiftnewsCV: UICollectionView!
    var robject:[redditObj]=[redditObj]()
       private var aspectConstraint: NSLayoutConstraint?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftNewsData()
        
        
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return robject.count
    }
   
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redditCollectionViewCell", for: indexPath) as! redditCollectionViewCell
        
         cell.layer.borderWidth =  0.5
        cell.maxWidth = collectionView.bounds.width - 16
        
        let imglink="\(robject[indexPath.row].image)"
        
         cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.titlelbl.text="\(robject[indexPath.row].title)"
        
        if imglink=="self" || imglink=="default"
        {
            cell.thumbnailImg.image=UIImage(named: "back")!
            cell.thumbnailImg.removeConstraints(cell.thumbnailImg.constraints)

        }
            
        else{
            
        let urlimg = URL(string: imglink)
    
    
            DispatchQueue.global(qos: .background).async {
                let data = try? Data(contentsOf: urlimg!)
                DispatchQueue.main.async {
                    if let imageData = data {
                        
                        cell.thumbnailImg.image=UIImage(data: imageData)
                        
                       
                    }
                   
                    
                   
                   
                    
                }
            }
            let aspectRatioConstraint = NSLayoutConstraint(item:  cell.thumbnailImg,attribute: .height,relatedBy: .equal,toItem:  cell.thumbnailImg,attribute: .width,multiplier: (CGFloat(self.robject[indexPath.row].thumbnail_width/self.robject[indexPath.row].thumbnail_height)),constant: 0)
            
            cell.thumbnailImg.addConstraint(aspectRatioConstraint)
    }
        
        return cell
    }
    
  
    
    func refresh()
    {
        if(self.swiftnewsCV != nil)
        {
            self.swiftnewsCV.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
        
        nextViewController.title="\(robject[indexPath.row].title)"
        nextViewController.A_title="\(robject[indexPath.row].title)"
        nextViewController.A_body="\(robject[indexPath.row].A_Body)"
        nextViewController.author="\(robject[indexPath.row].author)"
        nextViewController.thumbnail="\(robject[indexPath.row].image)"
       
        navigationController?.pushViewController(nextViewController, animated: true)
        
    }
   
    func SwiftNewsData()
    {
       
        class RequestHandler : NSObject, Reddit {
            
            var main1:ViewController? = nil
            
            init(_ main1:ViewController)
            {
                self.main1 = main1
            }
            
            func process_request(_ data:Data)
            {
                
                do
                {
                     self.main1!.robject.removeAll()
                    
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    print("reddit:\(jsonData)")
                    if let data_obj = jsonData as? NSDictionary
                    {
                    if let data = data_obj["data"] as? NSDictionary
                        {
                            if let children = data["children"] as? NSArray
                                {
                                   
                                    for i in 0 ..< children.count
                                    {
                                        if let childdic = children[i] as? NSDictionary
                                        {
                                            if let childData = childdic["data"] as? NSDictionary
                                            {
                                                self.main1!.robject.append(redditObj(childData))
                                            
                                                
                                            }

                                         
                                            
                                        }
                                    }
                                }
                        }
                       
                       
                    }
                     DispatchQueue.main.async(execute: self.main1!.refresh)
                
                    
                }
                catch
                {
                    return
                }
                
            }
        }
        
        
        PostDisplay_Data("\(appDelegate.jsonurl)", RequestHandler(self), "")
    }


}

