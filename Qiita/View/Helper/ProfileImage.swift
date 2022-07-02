//
//  ProfileImage.swift
//  Qiita
//
//  Created by ogura on 2022/07/02.
//

import SwiftUI

struct ProfileImage: View {
    
    var profileImageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: profileImageUrl)) { image in
            image
                .resizable()
                .frame(width: 30, height: 30)
                .cornerRadius(15)
        } placeholder: {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .cornerRadius(15)
        }
    }
}
