//
//  SearchExampleView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/2/24.
//

import SwiftUI

struct MarketView: View {
    @State private var isShowAnimation = false
    @State private var isShowAlert = false
    @State private var text = ""
    @State private var list = [Market]()
    private var filteredList: [Market] {
        if text.isEmpty {
            return list
        } else {
            return list.filter { $0.koreanName.contains(text) || $0.englishName.contains(text) }
        }
    }
    
    var body: some View {
        NavigationWrapper {
            VStack {
                ScrollView {
                    cardSpace()
                }
            }
            .navigationTitle("Search")
            .searchable(text: $text)
            .task { // SWift Concurrency
                do {
                    list = try await UpbitAPI.fetchUpbitMarketAPI()
                } catch {
                    print(error)
                    isShowAlert = true
                }
            }
            .alert("네트워크 에러", isPresented: $isShowAlert) {
                Button("확인", role: .cancel) {
                    print("딱히 할 건 없소,,,")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation(.bouncy) {
                            isShowAnimation.toggle()
                        }
                    } label: {
                        Image(systemName: "play.fill")
                    }
                }
            }
        }
    }
    
    func cardSpace() -> some View {
        ForEach(0..<filteredList.count, id: \.self) { i in
            NavigationLink {
                MarketDetailView(market: filteredList[i])
            } label: {
                cardView(market: filteredList[i])
                    .offset(
                        y: isShowAnimation ? Double(i) * -100 : 0
                    )
            }
        }
    }
    
    private func cardView(market: Market) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(market.color)
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.white.opacity(0.5))
                        .scaleEffect(2)
                        .offset(x: -60, y: 10)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(height: 150)
            
            VStack(alignment: .leading) {
                Text(market.koreanName)
                    .font(.title2)
                    .bold()
                Text(market.englishName)
                    .font(.callout)
                Text(market.market)
            }
            .foregroundStyle(.white)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity, alignment: .bottomLeading
            )
            .padding()
        }
        .padding()
    }
    
//    private func listView() -> some View {
//        LazyVStack {
//            ForEach(filteredList, id: \.hashValue) { item in
//                rowView(market: item)
//            }
//        }
//    }
    
    private func rowView(market: Market) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(market.koreanName)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.black)
                Text(market.market)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 6)
    }
}

#Preview {
    MarketView()
}
