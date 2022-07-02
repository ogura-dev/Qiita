//
//  Functions.swift
//  Qiita
//
//  Created by ogura on 2022/07/01.
//

import Foundation
import SwiftUI

func userInfo(_ id: String, _ name: String?, _ organization: String?) -> String {
    var userInfo = "@\(id)"
    if let name = name {
        if name != "" {
            userInfo += "(\(name))"
        }
    }
    if let organization = organization {
        if organization != "" {
            userInfo += "・\(organization)"
        }
    }
    return userInfo
}

func dateFormat(_ dateStr: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
    let date = dateFormatter.date(from: dateStr) ?? Date()
    dateFormatter.dateFormat = "yyyy月MM日dd"
    return dateFormatter.string(from: date)
}

func tagsText(_ tags: [Tag]) -> String {
    var tagsText = ""
    for tag in tags {
        if tag == tags.last {
            tagsText += tag.name
        } else {
            tagsText += "\(tag.name), "
        }
    }
    return tagsText
}
