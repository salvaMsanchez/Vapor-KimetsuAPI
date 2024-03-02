//
//  File.swift
//  
//
//  Created by Salva Moreno on 2/3/24.
//

import Vapor
import Fluent

struct EpisodesController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware()) { builder in
            builder.get("episodes", use: allEpisodes)
            builder.get("episodes", ":id", use: episode)
        }
    }
}

extension EpisodesController {
    func allEpisodes(req: Request) async throws -> [Episode.List] {
        try await Episode.query(on: req.db).all().map({ episode in
            Episode.List(id: episode.id, episodeNumber: episode.episodeNumber, title: episode.title, imageURL: episode.imageURL)
        })
    }
    
    func episode(req: Request) async throws -> Episode.Public {
        let id = req.parameters.get("id", as: UUID.self)
        
        guard let episode = try await Episode.find(id, on: req.db) else {
            throw Abort(.notFound, reason: "Episode not found")
        }
        
        // Eager Loading
        try await episode.$characters.load(on: req.db)
        
        return Episode.Public(id: episode.id, episodeNumber: episode.episodeNumber, title: episode.title, airedAt: episode.airedAt, summary: episode.summary, imageURL: episode.imageURL, characters: episode.characters)
    }
}
