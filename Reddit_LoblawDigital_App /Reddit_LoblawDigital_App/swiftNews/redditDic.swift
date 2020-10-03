//
//  redditDic.swift
//  Reddit_LoblawDigital_App
//
//  Created by Twinkle Trivedi on 2020-10-01.
//  Copyright © 2020 Twinkle Trivedi. All rights reserved.
//

import UIKit
protocol Reddit {
    func process_request(_ data:Data)
}
struct redditObj {
     var id=""
    var title = ""
    var image=""
    var A_Body=""
    var author=""
    var thumbnail_height=0
    var thumbnail_width=0
    
    
    init(_ data:NSDictionary)
    {
        
        if let add = data["id"] as? String
        {
            self.id = add
        }
        if let add = data["title"] as? String
        {
            self.title = add
        }
        if let add = data["thumbnail"] as? String
        {
            self.image = add
        }
        if let add = data["selftext"] as? String
        {
            self.A_Body = add
        }
        if let add = data["author"] as? String
        {
            self.author = add
        }
        if let add = data["thumbnail_height"] as? NSInteger
        {
            self.thumbnail_height = add
        }
        if let add = data["thumbnail_width"] as? NSInteger
        {
            self.thumbnail_width = add
        }
        
    }
}

func PostDisplay_Data( _ url:String, _ handler:Reddit, _ ps:String)
{
    
    let url:URL = URL(string: url)!
    let session = URLSession.shared
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
   
    let postString = ps
    
    request.httpBody = postString.data(using: .utf8)
    
    let task = session.dataTask(with: request, completionHandler: {
        (
        _data, response, error) in
        
        if let data = _data
        {
            handler.process_request(data)
        }
        
    })
    
    task.resume()
    
}
