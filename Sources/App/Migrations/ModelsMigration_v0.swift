//
//  File.swift
//  
//
//  Created by Salva Moreno on 28/2/24.
//

import Vapor
import Fluent

struct ModelsMigration_v0: AsyncMigration {
    
    func prepare(on database: FluentKit.Database) async throws {
        
        try await database
            .schema(User.schema)
            .id()
            .field("created_at", .string)
            .field("name", .string, .required)
            .field("email", .string, .required)
            .field("password", .string, .required)
            .unique(on: "email")
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        
        try await database.schema(User.schema).delete()
        
    }
    
}