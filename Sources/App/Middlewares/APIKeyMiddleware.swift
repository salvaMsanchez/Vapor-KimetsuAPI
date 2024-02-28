//
//  File.swift
//  
//
//  Created by Salva Moreno on 28/2/24.
//

import Vapor

struct APIKeyMiddleware: AsyncMiddleware {
    func respond(to request: Vapor.Request, chainingTo next: Vapor.AsyncResponder) async throws -> Vapor.Response {
        
        // Get API Key from headers
        guard let apiKey = request.headers.first(name: "Kimetsu-ApiKey") else {
            throw Abort(.badRequest, reason: "Kimetsu-ApiKey header is missing")
        }
        
        // Get API Key from environment
        guard let envApiKey = Environment.process.API_KEY else {
            throw Abort(.failedDependency)
        }
        
        guard apiKey == envApiKey else {
            throw Abort(.unauthorized, reason: "Invalid API Key")
        }
        
        // return try await next.respond(to: request)
        
        // Example of output modification
        let response = try await next.respond(to: request)
        response.headers.add(name: "My-App-Version", value: "v1.0.0")
        return response
    }
}
