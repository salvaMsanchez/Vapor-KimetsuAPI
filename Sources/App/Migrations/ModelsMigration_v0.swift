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
        
        try await database
            .schema(News.schema)
            .id()
            .field("created_at", .string)
            .field("title", .string, .required)
            .field("body", .string, .required)
            .field("imageURL", .string)
            .create()
        
        try await database
            .schema(Character.schema)
            .id()
            .field("name", .string, .required)
            .create()
        
        try await database
            .schema(Episode.schema)
            .id()
            .field("created_at", .string)
            .field("episode_number", .string, .required)
            .field("title", .string, .required)
            .field("aired_at", .string)
            .field("summary", .string, .required)
            .field("imageURL", .string)
            .create()
        
        try await database
            .schema(EpisodeCharacterPivot.schema)
            .id()
            .field("episode_id", .uuid, .required, .references(Episode.schema, "id"))
            .field("character_id", .uuid, .required, .references(Character.schema, "id"))
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema(User.schema).delete()
        try await database.schema(News.schema).delete()
        try await database.schema(Character.schema).delete()
        try await database.schema(Episode.schema).delete()
        try await database.schema(EpisodeCharacterPivot.schema).delete()
    }
}
