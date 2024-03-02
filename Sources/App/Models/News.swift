//
//  File.swift
//  
//
//  Created by Salva Moreno on 2/3/24.
//

import Vapor
import Fluent

final class News: Model, Content {
    // Schema
    static var schema = "news"
    
    // Properties
    @ID(key: .id)
    var id: UUID?
    
    @Timestamp(key: "created_at", on: .create, format: .iso8601)
    var createdAt: Date?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "body")
    var body: String
    
    @OptionalField(key: "imageURL")
    var imageURL: String?
    
    // Inits
    init() {}
    
    init(id: UUID? = nil, title: String, body: String, imageURL: String? = nil) {
        self.id = id
        self.title = title
        self.body = body
        self.imageURL = imageURL
    }
}
