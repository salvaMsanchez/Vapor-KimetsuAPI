//
//  File.swift
//  
//
//  Created by Salva Moreno on 28/2/24.
//

import Foundation
import Vapor

struct VersionController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.get("version", use: needsUpdate)
    }
}

extension VersionController {
    func needsUpdate(req: Request) async throws -> Version {
        guard let currentVersion: String = req.query["current"] else {
            throw Abort(.badRequest)
        }
        
        let appStoreVersion = "1.0.0"
        let needsUpdate = currentVersion < appStoreVersion
        
        return Version(
            current: currentVersion,
            live: appStoreVersion,
            needsUpdate: needsUpdate
        )
    }
}
