//
//  User.swift
//  HtppClient
//
//  Created by ink on 19/06/2019.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import Foundation

struct User {
    let login: String
    let  id: Int
    let score: Double
    
    init? (dict: [String:AnyObject]) {
        
            guard let login = dict["login"] as? String,
            let id = dict["id"] as? Int,
            let score = dict["score"] as? Double else { return nil }
        
            self.login = login
            self.id = id
            self.score = score
    }
    
    
//    login": "mojombo",
//    "id": 1,
//    "node_id": "MDQ6VXNlcjE=",
//    "avatar_url": "https://avatars0.githubusercontent.com/u/1?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/mojombo",
//    "html_url": "https://github.com/mojombo",
//    "followers_url": "https://api.github.com/users/mojombo/followers",
//    "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
//    "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
//    "organizations_url": "https://api.github.com/users/mojombo/orgs",
//    "repos_url": "https://api.github.com/users/mojombo/repos",
//    "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/mojombo/received_events",
//    "type": "User",
//    "site_admin": false,
//    "score": 97.17143
}
