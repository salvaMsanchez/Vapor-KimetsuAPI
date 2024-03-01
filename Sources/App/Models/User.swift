//
//  File.swift
//  
//
//  Created by Salva Moreno on 28/2/24.
//

import Vapor
import Fluent

final class User: Model {
    
    // Schema
    static var schema = "users"
    
    // Properties
    @ID(key: .id)
    var id: UUID?
    
    @Timestamp(key: "created_at", on: .create, format: .iso8601)
    var createdAt: Date?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "password")
    var password: String
    
    // Inits
    init() {}
    
    init(id: UUID? = nil, createdAt: Date? = nil, name: String, email: String, password: String) {
        self.id = id
        self.createdAt = createdAt
        self.name = name
        self.email = email
        self.password = password
    }
    
}

// DTOs
extension User {
    
    struct Create: Content, Validatable {
        let name: String
        let email: String
        let password: String
        
        static func validations(_ validations: inout Vapor.Validations) {
            validations.add("name", as: String.self, is: !.empty, required: true)
            validations.add("email", as: String.self, is: .email, required: true)
            validations.add("password", as: String.self, is: .count(6...), required: true)
        }
    }
    
    struct Public: Content {
        let id: UUID?
        let name: String
        let email: String
    }
    
}

extension User: ModelAuthenticatable {
    static var usernameKey = \User.$email
    static var passwordHashKey = \User.$password
    
    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.password)
    }
}
