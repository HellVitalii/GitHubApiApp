//
//  GetUserDetailResponse.swift
//  HtppClient
//
//  Created by ink on 20/06/2019.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import Foundation

struct GetUserDetailsResponse {
    let userDetails: UserDetails
    
    init (json: Any) throws {
        print(json)
        guard let dictionary = json as? [String: AnyObject] else { throw NetworkError.failInternetError }
        
        let userDetails = UserDetails(dict: dictionary)
      
        self.userDetails = userDetails
    }
}
