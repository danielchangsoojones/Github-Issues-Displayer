//
//  IssuesView.swift
//  Github-Issues-Displayer
//
//  Created by Daniel Jones on 12/1/17.
//  Copyright © 2017 Chong500Productions. All rights reserved.
//

import UIKit

class IssuesView: UIView {
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        self.frame = frame
        tableViewSetup()
    }
    
    private func tableViewSetup() {
        tableView = UITableView(frame: self.frame)
    }
}
