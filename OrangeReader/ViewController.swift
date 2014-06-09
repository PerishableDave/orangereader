//
//  ViewController.swift
//  OrangeReader
//
//  Created by David Peredo on 6/7/14.
//  Copyright (c) 2014 Wetnose Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let client = APIClient()
                            
    override func viewDidLoad() {
        super.viewDidLoad()

        client.getFrontpage(0, success: {(posts: Post[]) -> Void in
            println(posts)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

