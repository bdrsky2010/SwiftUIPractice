//
//  SnapCardView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/19/24.
//

import SwiftUI

struct SnapCardView: View {
    @Namespace var namespace
    @State private var index = 0
    @State private var items = [Card(title: "1"), Card(title: "2"), Card(title: "3"), Card(title: "4")]
    @State private var showDetailView = false
    @State private var card: Card?
    @State private var cardSize: CGSize = .zero
    
    var body: some View {
        VStack {
            SnapCarousel(spacing: 20, trailingSpace: 80, index: $index, items: items) { item in
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    Rectangle()
                        .frame(width: size.width, height: size.height)
                        .matchedGeometryEffect(id: item.id, in: namespace)
                        .onTapGesture {
                            cardSize = size
                            card = item
                            withAnimation(.easeInOut) {
                                showDetailView = true
                            }
                        }
                }
            }
            .padding(.vertical, 80)
            .overlay {
                if let card, showDetailView {
                    ScrollView {
                        VStack {
                            Rectangle()
                                .frame(width: cardSize.width, height: cardSize.height)
                                .matchedGeometryEffect(id: card.id, in: namespace)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        showDetailView = false
                                    }
                                }
                            
                            Text("""
                         It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                         """)
                            .multilineTextAlignment(.leading)
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.background)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    SnapCardView()
}
