//
//  UIColor.swift
//  Qiita
//
//  Created by ogura on 2022/07/01.
//

import Foundation
import UIKit

extension UIColor {
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}
