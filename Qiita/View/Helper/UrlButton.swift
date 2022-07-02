//
//  UrlButton.swift
//  Qiita
//
//  Created by ogura on 2022/07/02.
//

import SwiftUI

struct UrlButton: View {
    
    var url: String?
    var text: String
    var uiColor: UIColor
    
    var body: some View {
        if let url = url {
            if url != "" {
                Button {
                    openUrl(createUrl(url))
                } label: {
                    Text(text)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                }
                .background(Color(uiColor))
            }
        }
    }
    
    func createUrl(_ url: String) -> String {
        switch text {
        case "ユーザーを見る":
            return "https://qiita.com/\(url)"
        case "Facebook":
            return "https://facebook.com/\(url)"
        case "Github":
            return "https://github.com/\(url)"
        case "LinkedIn":
            return "https://www.linkedin.com/in/\(url)"
        case "Twitter":
            return "https://twitter.com/\(url)"
        default:
            return url
        }
    }
    
    func openUrl(_ url: String) {
        let url = URL(string: url)!
        UIApplication.shared.open(url)
    }
}
