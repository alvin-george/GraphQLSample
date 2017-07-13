//
//  AppModel.swift
//  GraphQLSample
//
//  Created by apple on 27/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import Apollo

struct SignUpResponse {
    let fullname : String
    let userCategory: String
    let id: String
    
    init(fullname: String, userCat: String, id: String) {
        self.fullname = fullname
        self.userCategory = userCat
        self.id = id
        
    }
}

struct LoginResponse {
    let fullname : String
    let userCategory: String
    let id: String
  
    
    init(fullname: String, userCat: String, id: String) {
        self.fullname = fullname
        self.userCategory = userCat
        self.id = id
       // self.token = token
        
    }
}
