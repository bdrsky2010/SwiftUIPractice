//
//  SearchExampleView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/2/24.
//

import SwiftUI

struct Market: Decodable, Hashable {
    let market: String
    let korean_name: String
    let english_name: String
    
    var title: String {
        return korean_name + " | " + english_name
    }
}

struct SearchExampleView: View {
    @State private var isShowAlert = false
    @State private var text = ""
    @State private var list = [Market]()
    private var filtedList: [Market] {
        if text.isEmpty {
            return list
        } else {
            return list.filter { $0.english_name.contains(text) || $0.korean_name.contains(text) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(filtedList, id: \.hashValue) { market in
                    Text("\(market.title)")
                }
                .listStyle(.inset)
            }
            .navigationTitle("Search")
            .searchable(text: $text)
            .task {
                do {
                    list = try await fetchUpbitMarketAPI()
                } catch {
                    isShowAlert = true
                }
            }
            .alert("네트워크 에러", isPresented: $isShowAlert) {
                Button("확인", role: .cancel) {
                    print("딱히 할 건 없소,,,")
                }
            }
        }
    }
    
    @MainActor
    private func fetchUpbitMarketAPI() async throws -> [Market] {
        guard let url = URL(string: "https://api.upbit.com/v1/market/all") else { return [] }
        let data = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([Market].self, from: data.0)
        return result
    }
}

#Preview {
    SearchExampleView()
}
