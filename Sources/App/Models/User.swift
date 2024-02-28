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
