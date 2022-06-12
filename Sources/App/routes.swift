import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "访问接口成功！"
    }
}
