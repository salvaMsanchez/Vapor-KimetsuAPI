import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.group("api", "v1") { builder in
        try builder.group(APIKeyMiddleware()) { builder in
            try builder.register(collection: AuxiliarController())
            try builder.register(collection: AuthController())
            try builder.register(collection: NewsController())
        }
    }
}
