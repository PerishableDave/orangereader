//
//  APIClient.swift
//  OrangeReader
//
//  Created by David Peredo on 6/7/14.
//  Copyright (c) 2014 Wetnose Labs. All rights reserved.
//

import Foundation

class APIClient {
    let basePath: NSURL
    let session: NSURLSession
    
    init() {
        session = NSURLSession.sharedSession()
        basePath = NSURL(string: "http://api.ihackernews.com")
    }
    
    func getFrontpage(page: Int?, success: (Post[]) -> Void) {
        let path = basePath + "/page"
        
        let task = session.dataTaskWithURL(path, completionHandler: {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            var error: NSError?
            let properties : AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(), error: &error) as? NSDictionary
            
            if let items = properties?["items"] as? NSArray {
                let posts = Post.postsFromProperties(items)
                success(posts)
            }
        })
        
        task.resume()
    }
}