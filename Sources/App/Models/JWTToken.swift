//
//  File.swift
//  
//
//  Created by Salva Moreno on 1/3/24.
//

import Vapor
import JWT

enum JWTTokenType: String, Codable {
    case access
    case refresh
}

struct JWTToken: Content, JWTPayload, Authenticatable {
    // MARK: - Properties
    var exp: ExpirationClaim
    var iss: IssuerClaim
    var sub: SubjectClaim
    var type: JWTTokenType
    
    // MARK: - JWTPayload
    func verify(using signer: JWTKit.JWTSigner) throws {
        // Expired
        try exp.verifyNotExpired()
        
        // Validate bundle id
        guard iss.value == Environment.process.APP_BUNDLE_ID else {
            throw JWTError.claimVerificationFailure(name: "iss", reason: "Issuer is invalid")
        }
        
        // Validate subject
        guard let _ = UUID(sub.value) else {
            throw JWTError.claimVerificationFailure(name: "sub", reason: "Subject is invalid")
        }
        
        // Validate JWT type
        guard type == .access || type == .refresh else {
            throw JWTError.claimVerificationFailure(name: "type", reason: "JWT type is invalid")
        }
    }
}

// MARK: - DTOs
extension JWTToken {
    struct Public: Content {
        let accessToken: String
        let refreshToken: String
    }
}

// MARK: - Auxiliar
extension JWTToken {
    static func generateToken(userID: UUID) -> (accessToken: JWTToken, refreshToken: JWTToken) {
        let now = Date.now
        
        var expDate = now.addingTimeInterval(Constants.accessTokenLifetime)
        let bundleID = Environment.process.APP_BUNDLE_ID!
        let user = userID.uuidString
        
        let accessToken = JWTToken(exp: .init(value: expDate), iss: .init(value: bundleID), sub: .init(value: user), type: .access)
        
        expDate = now.addingTimeInterval(Constants.refreshTokenLifetime)
        let refreshToken = JWTToken(exp: .init(value: expDate), iss: .init(value: bundleID), sub: .init(value: user), type: .refresh)
        
        return (accessToken, refreshToken)
    }
}
