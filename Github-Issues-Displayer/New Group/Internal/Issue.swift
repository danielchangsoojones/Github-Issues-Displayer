//
//  Issue.swift
//  Github-Issues-Displayer
//
//  Created by Daniel Jones on 12/1/17.
//  Copyright © 2017 Chong500Productions. All rights reserved.
//

import Foundation

class Issue {
    var title: String = ""
    var body: String = ""
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
