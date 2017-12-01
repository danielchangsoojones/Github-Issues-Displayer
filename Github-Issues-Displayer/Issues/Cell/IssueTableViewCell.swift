//
//  IssueTableViewCell.swift
//  Github-Issues-Displayer
//
//  Created by Daniel Jones on 12/1/17.
//  Copyright © 2017 Chong500Productions. All rights reserved.
//

import UIKit
import SnapKit

class IssueTableViewCell: UITableViewCell {
    override var reuseIdentifier: String? {
        return IssueTableViewCell.identifier
    }
    
    private var titleLabel: UILabel = UILabel()
    private var bodyLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabelSetup()
        bodyLabelSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func titleLabelSetup() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview().inset(5)
        }
    }
    
    private func bodyLabelSetup() {
        bodyLabel.numberOfLines = 3
        self.addSubview(bodyLabel)
        bodyLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
    }
    
    func set(_ issue: Issue) {
        titleLabel.text = issue.title
        bodyLabel.text = issue.body
    }
}

extension IssueTableViewCell {
    static let identifier: String = "issueTableCell"
}
