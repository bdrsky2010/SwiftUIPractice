//
//  UpbitAPI.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/3/24.
//

import Foundation

enum UpbitAPI {
    @MainActor
    static func fetchUpbitMarketAPI() async throws -> [Market] {
        guard let url = URL(string: "https://api.upbit.com/v1/market/all") else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([Market].self, from: data)
        return result
    }
}
