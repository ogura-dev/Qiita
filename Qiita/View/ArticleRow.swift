//
//  ArticleRow.swift
//  Qiita
//
//  Created by ogura on 2022/07/01.
//

import SwiftUI

struct ArticleRow: View {
    
    var article: Article
    
    var body: some View {
        HStack(alignment: .top) {
            ProfileImage(profileImageUrl: article.user.profileImageUrl)
            VStack(alignment: .leading, spacing: 5) {
                Text(userInfo(article.user.id, article.user.name, article.user.organization))
                Text(dateFormat(article.updatedAt))
                    .font(.system(size: 11))
                Text(article.title)
                    .font(.system(size: 15, weight: .bold))
                HImageText(imageName: "tags", text: tagsText(article.tags), frame: 15)
                HImageText(imageName: "lgtm", text: "\(article.likesCount)", frame: 15)
            }
        }
        .font(.system(size: 13))
    }
}
