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
            builder.group(User.authenticator(), User.guardMiddleware()) { builder in
                builder.get("signin", use: signIn)
            }
            builder.group(JWTToken.authenticator(), JWTToken.guardMiddleware()) { builder in
                builder.get("refresh", use: refresh)
            }
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
    
    func signIn(req: Request) async throws -> JWTToken.Public {
        // Get authenticated user
        let user = try req.auth.require(User.self)
        
        // Generate tokens
        let tokens = JWTToken.generateToken(userID: user.id!)
        let accessSigned = try req.jwt.sign(tokens.accessToken)
        let refreshSigned = try req.jwt.sign(tokens.refreshToken)
        
        return JWTToken.Public(accessToken: accessSigned, refreshToken: refreshSigned)
    }
    
    func refresh(req: Request) async throws -> JWTToken.Public {
        // Get refresh token
        let token = try req.auth.require(JWTToken.self)
        
        // Verify token type
        guard token.type == .refresh else {
            throw Abort(.methodNotAllowed, reason: "Token type must be refresh type")
        }
        
        // Get user Id and find on DB
        guard let user = try await User.find(UUID(token.sub.value), on: req.db) else {
            throw Abort(.unauthorized)
        }
        
        // Generate tokens
        let tokens = JWTToken.generateToken(userID: user.id!)
        let accessSigned = try req.jwt.sign(tokens.accessToken)
        let refreshSigned = try req.jwt.sign(tokens.refreshToken)
        
        return JWTToken.Public(accessToken: accessSigned, refreshToken: refreshSigned)
    }
}
