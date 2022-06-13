//
//  File.swift
//  
//
//  Created by YuHua on 2022/6/13.
//

import Vapor

struct ApiController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let api = routes.grouped("api", "menu")
        api.get(use: queryAll)
        api.post(use: add)
        api.delete(":id", use: delete)
        api.put(use: update)
    }
    
    func queryAll(_ req: Request) -> String {
        return "查询所有数据"
    }
    
    func update(_ req: Request) -> String {
        return "更新数据"
    }
    
    func add(_ req: Request) -> String {
        return "添加数据"
    }
    
    func delete(_ req: Request) -> String {
        return "删除数据"
    }
}
