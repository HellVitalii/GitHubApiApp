//
//  UserDetails.swift
//  HtppClient
//
//  Created by ink on 19/06/2019.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import Foundation

struct UserDetails {
    let name: String?
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: Bool?
    let bio: String?
    let repos: Int?
    let gists: Int?
    let followers: Int?
    let following: Int?
    let avatarUrl: String?
    
    init (dict: [String: AnyObject]) {
        
        self.name = dict["name"] as? String
        self.company = dict["company"] as? String
        self.blog = dict["blog"] as? String
        self.location = dict["location"] as? String
        self.email = dict["email"] as? String
        self.hireable = dict["hireable"] as? Bool
        self.bio = dict["bio"] as? String
        self.repos = dict["public_repos"] as? Int
        self.gists = dict["public_gists"] as? Int
        self.followers = dict["followers"] as? Int
        self.following = dict["following"] as? Int
        self.avatarUrl = dict["avatar_url"] as? String
    }
}
