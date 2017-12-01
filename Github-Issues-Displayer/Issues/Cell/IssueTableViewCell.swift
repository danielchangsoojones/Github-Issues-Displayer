//
//  IssueTableViewCell.swift
//  Github-Issues-Displayer
//
//  Created by Daniel Jones on 12/1/17.
//  Copyright © 2017 Chong500Productions. All rights reserved.
//

import UIKit

class IssueTableViewCell: UITableViewCell {
    override var reuseIdentifier: String? {
        return IssueTableViewCell.identifier
    }
    
    var titleLabel: UILabel = UILabel()
    var bodyLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func titleLabelSetup() {
        titleLabel
    }
    
    func setContent(issue: Issue) {
        
    }
}

extension IssueTableViewCell {
    static let identifier: String = "issueTableCell"
}
