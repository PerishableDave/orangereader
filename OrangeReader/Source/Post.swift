//
//  Post.swift
//  OrangeReader
//
//  Created by David Peredo on 6/7/14.
//  Copyright (c) 2014 Wetnose Labs. All rights reserved.
//

import Foundation

class Post {
    let title: String
    let URL: String
    let id: Int
    let commentCount: Int
    let points: Int
    let poster: String
    
    class func postFromProperties(properties: NSDictionary) -> Post? {
        var post: Post?
        
        let title = properties["title"] as? String
        let URL = properties["url"] as? String
        let id = properties["id"] as? Int
        let commentCount = properties["commentCount"] as? Int
        let points = properties["points"] as? Int
        let poster = properties["postedBy"] as? String
        
        if title && URL && id && commentCount && points && poster {
            post = Post(title: title!, URL: URL!, id: id!, commentCount: commentCount!, points: points!, poster: poster!)
        }
        
        
        
        return post
    }
    
    class func postsFromProperties(properties: Array<AnyObject>) -> Post[] {
        var posts = Post[]()
        
        for object : AnyObject in properties {
            if let itemDict = object as? NSDictionary {
                if let post = postFromProperties(itemDict) {
                    posts.append(post)
                }
            }
        }
        
        return posts
    }
    
    init(title: String, URL: String, id: Int, commentCount: Int, points: Int, poster: String) {
        self.title = title
        self.URL = URL
        self.id = id
        self.commentCount = commentCount
        self.points = points
        self.poster = poster
    }
}