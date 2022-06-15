//
//  File.swift
//  
//
//  Created by YuHua on 2022/6/15.
//

import Fluent

struct CreateMenu: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("menu")
            .id()
            .field("title", .string, .required)
            .field("super_id", .uuid)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("menu").delete()
    }
}
