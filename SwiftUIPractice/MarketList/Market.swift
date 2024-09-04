//
//  Market.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/3/24.
//

import SwiftUI

struct Market: Hashable, Codable {
    let id = UUID()
    let market, koreanName, englishName: String
    let color = Color(red: .random(in: 0...1),
                      green: .random(in: 0...1),
                      blue: .random(in: 0...1))

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}
