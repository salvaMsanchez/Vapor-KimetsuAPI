//
//  File.swift
//  
//
//  Created by Salva Moreno on 2/3/24.
//

import Vapor
import Fluent

struct NewsController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.group(JWTToken.authenticator(), JWTToken.guardMiddleware()) { builder in
            builder.get("news", use: allNews)
            builder.get("news", ":id", use: getNewsByID)
        }
    }
}

extension NewsController {
    func allNews(req: Request) async throws -> [News] {
        try await News.query(on: req.db).all()
    }
    
    func getNewsByID(req: Request) async throws -> News {
        // Get ID from the request
        let id = req.parameters.get("id", as: UUID.self)
        
        // Find ID on DB
        guard let news = try await News.find(id, on: req.db) else {
            throw Abort(.notFound, reason: "News ID not found")
        }
        
        return news
    }
}
