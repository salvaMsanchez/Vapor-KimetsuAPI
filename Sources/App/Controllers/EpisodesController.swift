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
    func allEpisodes(req: Request) async throws -> [String] {
        
        
        return []
    }
    
    func episode(req: Request) async throws -> String {
        
        
        return ""
    }
}
