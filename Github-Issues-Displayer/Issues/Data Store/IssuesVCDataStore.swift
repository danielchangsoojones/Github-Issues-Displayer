//
//  IssuesVCDataStore.swift
//  Github-Issues-Displayer
//
//  Created by Daniel Jones on 12/1/17.
//  Copyright © 2017 Chong500Productions. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol IssuesVCDataDelegate {
    func received(_ issues: [Issue])
}

class IssuesVCDataStore {
    var delegate: IssuesVCDataDelegate?
    
    init(delegate: IssuesVCDataDelegate) {
        self.delegate = delegate
    }
}

extension IssuesVCDataStore {
    func getIssues(repo: String = "popwarsweet/PageControls") {
        if let url = URL(string: "https://api.github.com/repos/" + repo + "/issues") {
            let req = URLRequest(url: url)
            let responseJSON = URLSession.shared.rx.json(request: req)
            
            // no requests will be performed up to this point
            // `responseJSON` is just a description how to fetch the response
            
            
            let cancelRequest = responseJSON
                // this will fire the request
                .subscribe(onNext: { json in
                    self.parse(json)
                })
            
            Thread.sleep(forTimeInterval: 3.0)
            
            // if you want to cancel request after 3 seconds have passed just call
            cancelRequest.dispose()
        }
    }
    
    private func parse(_ json: Any) {
        if let jsonArray = json as? [NSDictionary] {
            let issues = convert(jsonArray)
            self.delegate?.received(issues)
        }
    }
    
    private func convert(_ jsonArray: [NSDictionary]) -> [Issue] {
        var issues: [Issue] = []
        for issueJSON in jsonArray {
            let body: String = issueJSON["body"] as? String ?? ""
            let title: String = issueJSON["title"] as? String ?? ""
            let issue = Issue(title: title, body: body)
            issues.append(issue)
        }
        
        return issues
    }
}
