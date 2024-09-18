//
//  CustomCarousel.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/17/24.
//

import SwiftUI

struct CustomCarousel<Content: View, Item, ID>: View where Item: RandomAccessCollection, ID: Hashable {
    var content: (Item.Element, CGSize) -> Content
    var id: KeyPath<Item.Element, ID>
    
    var spacing: CGFloat
    var cardPadding: CGFloat
    var items: Item
    @Binding var index: Int
    
    init(index: Binding<Int>, items: Item, spacing: CGFloat = 30, cardPadding: CGFloat = 80, id: KeyPath<Item.Element, ID>, @ViewBuilder content: @escaping (Item.Element, CGSize) -> Content) {
        self.content = content
        self.id = id
        self.spacing = spacing
        self.cardPadding = cardPadding
        self.items = items
        self._index = index
    }
    
    // MARK: Gesture Properties
    @GestureState var translation: CGFloat = 0
    @State private var offset: CGFloat = 0
    @State private var lastStoredOffset: CGFloat = 0
    @State private var currentIndex: Int = 0
    
    // MARK: Rotation
    @State private var rotation: Double = 0
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let cardWidth = size.width - (cardPadding - spacing)
            LazyHStack(spacing: spacing) {
                ForEach(items, id: id) { item in
                    content(item, CGSize(width: size.width - cardPadding, height: size.height))
                        .frame(width: size.width - cardPadding, height: size.height)
                }
            }
            .padding(.horizontal, spacing)
            .contentShape(Rectangle())
            .offset(x: limitScroll())
            .gesture(
                DragGesture(minimumDistance: 5)
                    .updating($translation, body: { value, state, _ in
                        state = value.translation.width
                    })
                    .onChanged { onChanged($0, cardWidth: cardWidth) }
                    .onEnded { onEnded($0, cardWidth: cardWidth) }
            )
        }
        .onAppear {
            let extraSpace = (cardPadding / 2) - spacing
            offset = extraSpace
            lastStoredOffset = extraSpace
        }
        .animation(.easeInOut, value: translation == 0)
    }
    
    // MARK: Limiting Scroll On First And Last Items
    private func limitScroll() -> CGFloat {
        let extraSpace = (cardPadding / 2) - spacing
        
        if index == 0, offset > extraSpace {
            return extraSpace + (offset / 4)
        } else if index == items.count - 1, translation < 0 {
            return offset - (translation / 2)
        } else {
            return offset
        }
    }
    
    private func onChanged(_ value: DragGesture.Value, cardWidth: CGFloat) {
        let translationX = value.translation.width
        offset = translationX + lastStoredOffset
    }
    
    private func onEnded(_ value: DragGesture.Value, cardWidth: CGFloat) {
        // MARK: Finding Current Index
        var _index = (offset / cardWidth).rounded()
        _index = max(-CGFloat(items.count - 1), _index)
        _index = min(_index, 0)
        
        currentIndex = Int(_index)
        
        // MARK: Updating Index
        // Note: Since We're Moving On Right Side
        // So All Data Will be Negative
        index = -currentIndex
        
        withAnimation(.easeInOut(duration: 0.25)) {
            // MARK: Removing Extra Space
            // / 2 -> Need Both Sides Need to Be Visible
            let extraSpace = (cardPadding / 2) - spacing
            offset = cardWidth * _index + extraSpace
        }
        
        lastStoredOffset = offset
    }
}

#Preview {
    CardView()
}
