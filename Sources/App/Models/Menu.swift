//
//  File.swift
//  
//
//  Created by YuHua on 2022/6/15.
//

import Vapor
import Fluent

final class Menu: Model {
    // 数据库表名
    static let schema = "menu"
    
    // 使用UUID作为id，没有使用自增id，是为了适配NoSQL
    @ID
    var id: UUID?
    
    // 标题
    @Field(key: "title")
    var title: String
    
    // 父id，数据库字段名为super_id，名为superId，两者可以不一样。
    // 如果字段是可选的，需要使用OptionalField
    @OptionalField(key: "super_id")
    var superId: UUID?
    
    // 必须要有一个空的初始化方法
    init() {}
    
    // 自定义的初始化方法
    init(id: UUID? = nil, title: String, superId: UUID? = nil) {
        self.id = id
        self.title = title
        self.superId = superId
    }
}
