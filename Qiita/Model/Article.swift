//
//  Article.swift
//  Qiita
//
//  Created by ogura on 2022/07/01.
//

import Foundation

struct Article: Codable {
    
    var createdAt: String
    var id: String
    var likesCount: Int
    var tags: [Tag]
    var title: String
    var updatedAt: String
    var url: String
    var user: User
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id
        case likesCount = "likes_count"
        case tags
        case title
        case updatedAt = "updated_at"
        case url
        case user
    }
}
