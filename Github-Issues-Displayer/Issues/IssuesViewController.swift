//
//  ViewController.swift
//  Github-Issues-Displayer
//
//  Created by Daniel Jones on 12/1/17.
//  Copyright © 2017 Chong500Productions. All rights reserved.
//

import UIKit

class IssuesViewController: UIViewController {
    var tableView: UITableView!
    
    var issues: [Issue] = []
    var dataStore: IssuesVCDataStore?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        dataStoreSetup()
    }
    
    private func dataStoreSetup() {
        dataStore = IssuesVCDataStore(delegate: self)
        dataStore?.getIssues()
    }
    
    private func viewSetup() {
        let issuesView = IssuesView(frame: self.view.bounds)
        self.view = issuesView
        tableView = issuesView.tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension IssuesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension IssuesViewController: IssuesVCDataDelegate {
    func received(_ issues: [Issue]) {
        self.issues = issues
        tableView.reloadData()
    }
}
