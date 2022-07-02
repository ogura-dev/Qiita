//
//  HImageText.swift
//  Qiita
//
//  Created by ogura on 2022/07/02.
//

import SwiftUI

struct HImageText: View {
    
    var imageName: String
    var text: String?
    var frame: CGFloat
    
    var body: some View {
        if let text = text {
            if text != "" {
                HStack {
                    Image(imageName)
                        .resizable().scaledToFit()
                        .frame(width: frame, height: frame)
                    Text(text)
                }
            }
        }
    }
}
