import Vapor

func routes(_ app: Application) throws {
    let api = ApiController()
    try app.register(collection: api)
}
