import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // 连接数据库
    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? 0,
        username: Environment.get("DATABASE_USERNAME") ?? "",
        password: Environment.get("DATABASE_PASSWORD") ?? "",
        database: Environment.get("DATABASE_NAME") ?? ""
    ), as: .psql)
    
    // 创建表
    app.migrations.add(CreateMenu())
    // 设置打印等级
    app.logger.logLevel = .debug
    // 等待数据库操作完毕
    try app.autoMigrate().wait()
    
    // register routes
    try routes(app)
}
