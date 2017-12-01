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
    var date: Date = Date()
    var body: String = ""
    
    init(title: String, date: Date, body: String) {
        self.title = title
        self.date = date
        self.body = body
    }
}
