//
//  Tag.swift
//  Qiita
//
//  Created by ogura on 2022/07/01.
//

import Foundation

struct Tag: Codable, Equatable {
    
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
