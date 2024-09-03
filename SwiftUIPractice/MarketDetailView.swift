//
//  MarketDetailView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/3/24.
//

import SwiftUI

struct MarketDetailView: View {
    @State private var isRotate = false
    let market: Market
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(market.koreanName)
                Text(market.englishName)
                Text(market.market)
            }
            .rotationEffect(.degrees(isRotate ? 180 : 360))
            .padding()
            
            Button("ROTATION") {
                withAnimation(.bouncy) {
                    isRotate.toggle()
                }
            }
            .asBlueCapsule(background: .blue)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
