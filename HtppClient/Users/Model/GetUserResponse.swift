//
//  GetUserResponse.swift
//  HtppClient
//
//  Created by ink on 19/06/2019.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import Foundation

// ответ с сервера для заполнения массива
struct GetUserResponse {
    let users: [User]
    
    init (json: Any) throws {
        print(json)
        guard let array = json as? [String: AnyObject] else { throw NetworkError.failInternetError }
        guard (array["total_counts"] as? Int) != 0 else {print("wrong int"); throw NetworkError.failInternetError }
        
        guard let usersArray = array["items"] as? [[String : AnyObject]] else {print("wrong items");throw NetworkError.failInternetError }
        
        var users = [User]()
       print(usersArray)
        
       for dictionary in usersArray{
        
            guard let user = User(dict: dictionary) else {continue}
            users.append(user)
       }
        self.users = users
    }
}
