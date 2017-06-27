//
//  Login.swift
//  GraphQLSample
//
//  Created by apple on 27/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import Apollo

extension UserType: JSONDecodable, JSONEncodable {}

public final class LoginMutation: GraphQLMutation {
    
    public static let operationDefinition =
    "mutation userLogin($civilId:String!,$password :String!)" + "{" + "loginResponse($civilId:String!,$password :String!)" + "{" + "id" + "fullName" + "userCategory" + "token" + "}" + "}"
    

    public let civilId: String
    public let password: String
    
    public init(civilId: String, password: String) {

        self.civilId = civilId
        self.password = password
        
    }
    
    public var variables: GraphQLMap? {
        
        return ["civilId": civilId, "password": password]
    }
    
    public struct Data: GraphQLMappable {
        
        public var userLogin: LoginStructure?
        
        public init(reader: GraphQLResultReader) throws {
            
            userLogin = try reader.optionalValue(for: Field(responseName: "userLogin", arguments: ["civilId": reader.variables["civilId"], "password": reader.variables["password"]]))
        }
        
        public struct LoginStructure: GraphQLMappable {
            public let __typename: String
            public let id: String?
            public let token: String?
            public let userCategory: UserType?
            public let fullName: String?
            
            public init(reader: GraphQLResultReader) throws {
                
                __typename = try reader.value(for: Field(responseName: "__typename"))
                id = try reader.optionalValue(for: Field(responseName: "id"))
                token = try reader.optionalValue(for: Field(responseName: "token"))
                userCategory = try reader.optionalValue(for: Field(responseName: "userCategory"))
                fullName = try reader.optionalValue(for: Field(responseName: "fullName"))
            }
        }
    }
}
