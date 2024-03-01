import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor
import JWT

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    guard let jwtKey = Environment.process.JWT_KEY else { fatalError("JWT_KEY not found") }
    guard let _ = Environment.process.API_KEY else { fatalError("API_KEY not found") }
    guard let dbURL = Environment.process.DATABASE_URL else { fatalError("DATABASE_URL not found") }
    guard let _ = Environment.process.APP_BUNDLE_ID else { fatalError("APP_BUNDLE_ID not found") }
    
    // Configure DB
    try app.databases.use(.postgres(url: dbURL), as: .psql)
    
    // Configure paswords hashes
    app.passwords.use(.bcrypt)
    
    // Configure JWT
    app.jwt.signers.use(.hs256(key: jwtKey))
    
    // ...
    
    // Migrations
    app.migrations.add(ModelsMigration_v0())
    try await app.autoMigrate()

    // Register routes
    try routes(app)
}
