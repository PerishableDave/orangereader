//
//  PostsController.swift
//  OrangeReader
//
//  Created by David Peredo on 6/8/14.
//  Copyright (c) 2014 Wetnose Labs. All rights reserved.
//

import UIKit

class PostsController: UITableViewController, UITableViewDataSource {
    let client: APIClient
    var posts = Post[]()
    
    init(coder: NSCoder?) {
        client = APIClient()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        
        client.getFrontpage(0, success: {[weak self] (posts: Post[]) -> Void  in
            if let controller = self {
                controller.posts = posts
                controller.tableView.reloadData()
            }
        })
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostsCell") as UITableViewCell
        
        let post = posts[indexPath.row]
        
        if let label = cell.contentView.viewWithTag(1) as? UILabel {
            label.text = post.title
        }
        
        return cell
    }
    
    @IBAction func refresh(sender: UIRefreshControl) {
        
    }
}
