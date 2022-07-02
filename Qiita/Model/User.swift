//
//  User.swift
//  Qiita
//
//  Created by ogura on 2022/07/01.
//

import Foundation

struct User: Codable {
    
    var description: String?
    var facebookId: String?
    var followeesCount: Int
    var followersCount: Int
    var githubLoginName: String?
    var id: String
    var itemsCount: Int
    var linkedinId: String?
    var location: String?
    var name: String?
    var organization: String?
    var permanentId: Int
    var profileImageUrl: String
    var twitterScreenName: String?
    var websiteUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case description
        case facebookId = "facebook_id"
        case followeesCount = "followees_count"
        case followersCount = "followers_count"
        case githubLoginName = "github_login_name"
        case id
        case itemsCount = "items_count"
        case linkedinId = "linkedin_id"
        case location
        case name
        case organization
        case permanentId = "permanent_id"
        case profileImageUrl = "profile_image_url"
        case twitterScreenName = "twitter_screen_name"
        case websiteUrl = "website_url"
    }
}
