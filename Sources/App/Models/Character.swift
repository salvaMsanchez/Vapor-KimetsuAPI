//
//  File.swift
//  
//
//  Created by Salva Moreno on 2/3/24.
//

import Vapor
import Fluent

final class Character: Model {
    // Schema
    static var schema = "characters"
    
    // Properties
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Siblings(through: EpisodeCharacterPivot.self, from: \.$character, to: \.$episode)
    var episodes: [Episode]
    
    // Inits
    init() {}
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
