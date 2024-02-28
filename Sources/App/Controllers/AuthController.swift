//
//  File.swift
//  
//
//  Created by Salva Moreno on 29/2/24.
//

import Vapor
import Fluent

struct AuthController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        routes.post("users", use: testUserCreation)
    }
    
    
}

extension AuthController {
    
    func testUserCreation(req: Request) async throws -> User.Public {
        
        let userCreate = try req.content.decode(User.Create.self)
        let user = User(name: userCreate.name, email: userCreate.email, password: userCreate.password)
        
        try await user.create(on: req.db)
        
        return User.Public(id: user.id, name: user.name, email: user.email)
    }
}
