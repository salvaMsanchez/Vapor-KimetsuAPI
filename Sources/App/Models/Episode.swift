//
//  File.swift
//  
//
//  Created by Salva Moreno on 2/3/24.
//

import Vapor
import Fluent

final class Episode: Model {
    // Schema
    static var schema = "episodes"
    
    // Properties
    @ID(key: .id)
    var id: UUID?
    
    @Timestamp(key: "created_at", on: .create, format: .iso8601)
    var createdAt: Date?
    
    @Field(key: "episode_number")
    var episodeNumber: Int
    
    @Field(key: "title")
    var title: String
    
    @Timestamp(key: "aired_at", on: .none, format: .iso8601)
    var airedAt: Date?
    
    @Field(key: "summary")
    var summary: String
    
    @OptionalField(key: "imageURL")
    var imageURL: String?
    
    @Siblings(through: EpisodeCharacterPivot.self, from: \.$episode, to: \.$character)
    var characters: [Character]
    
    // Inits
    init() {}
    
    init(id: UUID? = nil, episodeNumber: Int, title: String, airedAt: Date? = nil, summary: String, imageURL: String? = nil) {
        self.id = id
        self.episodeNumber = episodeNumber
        self.title = title
        self.airedAt = airedAt
        self.summary = summary
        self.imageURL = imageURL
    }
}

// MARK: - DTOs
extension Episode {
    struct List: Content {
        let id: UUID?
        let episodeNumber: Int
        let title: String
        let imageURL: String?
    }
    
    struct Public: Content {
        let id: UUID?
        let episodeNumber: Int
        let title: String
        let airedAt: Date?
        let summary: String
        let imageURL: String?
        let characters: [Character]
    }
}
