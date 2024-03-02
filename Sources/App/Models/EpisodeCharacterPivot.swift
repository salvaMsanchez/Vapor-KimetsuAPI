//
//  File.swift
//  
//
//  Created by Salva Moreno on 2/3/24.
//

import Vapor
import Fluent

final class EpisodeCharacterPivot: Model {
    // Schema
    static var schema = "episode+character"
    
    // Properties
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "episode_id")
    var episode: Episode
    
    @Parent(key: "character_id")
    var character: Character
    
    // Inits
    init() {}
    
    init(id: UUID? = nil, episode: Episode, character: Character) throws {
        self.id = id
        self.$episode.id = try episode.requireID()
        self.$character.id = try character.requireID()
    }
}
