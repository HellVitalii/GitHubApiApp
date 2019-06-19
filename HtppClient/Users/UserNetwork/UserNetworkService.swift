//
//  UserNetworkService.swift
//  HtppClient
//
//  Created by ink on 19/06/2019.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import Foundation

class UserNetworkService {
    private init() {}
    
    //заполнение массива пользователей
    static func getUsers(info: String, completion: @escaping(GetUserResponse) -> ()) {
        guard let url = URL(string: "https://api.github.com/search/users?q="+info) else {
            return
        }
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetUserResponse(json: json)
                completion(response)
            }
            catch {
                print(error)
            }
        }
    }
}
