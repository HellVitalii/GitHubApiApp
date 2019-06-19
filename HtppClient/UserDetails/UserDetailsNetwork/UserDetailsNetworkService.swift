//
//  UserDetailsNetworkService.swift
//  HtppClient
//
//  Created by ink on 19/06/2019.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import Foundation

class UserDetailsNetworkService {
    private init() {}    
    
    static func getUserDetails(login: String, completion: @escaping(GetUserDetailsResponse) -> ()) {
        guard let url = URL(string: "https://api.github.com/users/"+login) else {
            return
        }
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetUserDetailsResponse(json: json)
                completion(response)
            }
            catch {
                print(error)
            }
        }
    }
}
