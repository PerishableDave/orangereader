//
//  NSURLExtensions.swift
//  OrangeReader
//
//  Created by David Peredo on 6/7/14.
//  Copyright (c) 2014 Wetnose Labs. All rights reserved.
//

import Foundation

@infix func + (URL: NSURL, appendedString: String) -> NSURL {
    return NSURL(string: URL.absoluteString + appendedString)
}