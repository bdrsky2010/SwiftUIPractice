//
//  CardView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/17/24.
//

import SwiftUI

struct Card: Hashable, Identifiable {
    let id = UUID()
    var title: String
}

struct CardView: View {
    @Namespace var namespace
    @State private var index = 0
    @State private var items = [Card(title: "1"), Card(title: "2"), Card(title: "3"), Card(title: "4")]
    @State private var cardSize: CGSize = .zero
    @State private var show = false
    var body: some View {
        VStack {
            ZStack {
                CardItem(namespace: namespace, show: $show, index: $index, items: $items, cardSize: $cardSize)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.6,
                                              dampingFraction: 0.8)) {
                            show = true
                        }
                    }
                    
                if show {
                    GeometryReader { proxy in
                        ScrollView {
                            VStack {
                                Rectangle()
                                    .frame(width: proxy.size.width * 0.8, height: proxy.size.height * 0.4)
//                                    .frame(width: cardSize.width, height: cardSize.height)
                                    .padding(.top, 80)
                                    .padding(.bottom, 20)
                                    .matchedGeometryEffect(id: "CARD", in: namespace, isSource: show)
                                    
                                Text("""
                             It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                             """)
                            }
                        }
                        .border(.blue, width: 1)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6,
                                                  dampingFraction: 0.8)) {
                                show  = false
                            }
                        }
                    }
                    .ignoresSafeArea()
                    .background(.background)
                    .border(.red, width: 1)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background {
//                        BackgroundView(index: $index, items: items)
        }
        .ignoresSafeArea()
    }
}

fileprivate struct CardItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @Binding var index: Int
    @Binding var items: [Card]
    @Binding var cardSize: CGSize
    var body: some View {
        CustomCarousel(index: $index, items: $items, spacing: 20, cardPadding: 80, id: \.id) { item, _cardSize in
            cardSize = _cardSize
            return Rectangle()
                .frame(width: _cardSize.width, height: _cardSize.height)
        }
        .padding(.horizontal, -15)
        .padding(.vertical, 200)
        .matchedGeometryEffect(id: "CARD", in: namespace, isSource: !show)
    }
}

fileprivate struct BackgroundView: View {
    @Binding var index: Int
    let items: [Card]
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            TabView(selection: $index) {
                ForEach(items, id: \.id) { item in
                    Rectangle()
                        .frame(width: size.width, height: size.height)
                        .clipped()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: index)
            
            Rectangle()
                .fill(.ultraThinMaterial)
        }
    }
}

#Preview {
    CardView()
}
