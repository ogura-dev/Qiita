//
//  DetailView.swift
//  Qiita
//
//  Created by ogura on 2022/07/01.
//

import SwiftUI

struct DetailView: View {
    
    var article: Article
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(article.title)
                    .font(.system(size: 20, weight: .bold))
                HImageText(imageName: "tags", text: tagsText(article.tags), frame: 20)
                Text("投稿日 \(dateFormat(article.createdAt))　更新日 \(dateFormat(article.updatedAt))")
                    .font(.system(size: 13))
                UrlButton(url: article.url, text: "記事を見る", uiColor: UIColor.rgb(116, 194, 58))
            }
            Divider()
                .padding(.vertical)
            ScrollView {
                VStack(spacing: 15) {
                    HStack {
                        ProfileImage(profileImageUrl: article.user.profileImageUrl)
                        Text(userInfo(article.user.id, article.user.name, nil))
                            .bold()
                    }
                    HStack(spacing: 40) {
                        VStack {
                            Text("\(article.user.itemsCount)")
                            Text("投稿")
                        }
                        VStack {
                            Text("\(article.user.followeesCount)")
                            Text("フォロー")
                        }
                        VStack {
                            Text("\(article.user.followersCount)")
                            Text("フォロワー")
                        }
                    }
                    HImageText(imageName: "organization", text: article.user.organization, frame: 20)
                    HImageText(imageName: "location", text: article.user.location, frame: 20)
                    if let description = article.user.description {
                        Text(description)
                            .font(.system(size: 17))
                    }
                    UrlButton(url: article.user.facebookId, text: "Facebook", uiColor: UIColor.rgb(57, 118, 234))
                    UrlButton(url: article.user.githubLoginName, text: "Github", uiColor: UIColor.rgb(33, 33, 33))
                    UrlButton(url: article.user.linkedinId, text: "LinkedIn", uiColor: UIColor.rgb(51, 117, 176))
                    UrlButton(url: article.user.twitterScreenName, text: "Twitter", uiColor: UIColor.rgb(77, 159, 235))
                    UrlButton(url: article.user.websiteUrl, text: "Website", uiColor: UIColor.rgb(158, 158, 158))
                }
            }
            Spacer()
        }
        .navigationTitle("詳細")
        .padding()
        .font(.system(size: 15))
    }
}
