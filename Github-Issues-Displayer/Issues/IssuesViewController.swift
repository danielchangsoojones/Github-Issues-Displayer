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
        tableViewSetup()
    }
}

extension IssuesViewController: UITableViewDelegate, UITableViewDataSource {
    fileprivate func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IssueTableViewCell.self, forCellReuseIdentifier: IssueTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IssueTableViewCell.identifier, for: indexPath) as! IssueTableViewCell
        let issue = issues[indexPath.row]
        cell.set(issue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        searchBar.backgroundColor = .red
        searchBar.delegate = self
        return searchBar
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension IssuesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            //TODO: Parse the search bar text to pull out the username and repo name, but I didn't have time to do this.
            //TODO: Pass the github repo name to my data store, so it can search and display results
            self.dataStore?.getIssues()
        }
    }
}

extension IssuesViewController: IssuesVCDataDelegate {
    func received(_ issues: [Issue]) {
        self.issues = issues
        tableView.reloadData()
    }
}
