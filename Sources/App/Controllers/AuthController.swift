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
        
        routes.group("auth") { builder in
            builder.post("signup", use: signUp)
        }
        
        
    }
    
    
}

extension AuthController {
    
    func signUp(req: Request) async throws -> JWTToken.Public {
        
        // Validate content entry
        try User.Create.validate(content: req)
        
        // Decode user data
        let userCreate = try req.content.decode(User.Create.self)
        let passwordHashed = try req.password.hash(userCreate.password)
        
        // Save user to DB
        let user = User(name: userCreate.name, email: userCreate.email, password: passwordHashed)
        try await user.create(on: req.db)
        
        // Generate tokens
        let tokens = JWTToken.generateToken(userID: user.id!)
        let accessSigned = try req.jwt.sign(tokens.accessToken)
        let refreshSigned = try req.jwt.sign(tokens.refreshToken)
        
        return JWTToken.Public(accessToken: accessSigned, refreshToken: refreshSigned)
    }
}
