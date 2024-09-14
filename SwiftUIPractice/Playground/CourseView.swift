//
//  CourseView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/12/24.
//

import SwiftUI

// 스크롤 오프셋을 저장하기 위한 PreferenceKey
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct CourseView: View {
    var namespace: Namespace.ID
    @Binding var isShow: Bool
    @Binding var dragOffset: CGSize
    @State private var scaleFactor: CGFloat = 1
    @State private var offset: CGSize = .zero
    @State private var scrollOffset: CGFloat = 0 // 스크롤 오프셋을 저장하는 변수
    @State private var defaultOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    cover
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: proxy.frame(in: .named("scrollView")).minY)
                    }
                    VStack {
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                        Text("kjsadhfljksadhflkjhdsalf")
                    }
                }
                .scaleEffect(scaleFactor)
            }
            .background(Color.gray.opacity(0.5))
            .ignoresSafeArea()
            .statusBar(hidden: true)
            .coordinateSpace(name: "scrollView")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                print(value)
                if defaultOffset == 0 { 
                    defaultOffset = value
                    print(defaultOffset)
                }
                if value - defaultOffset > 0 {
                    withAnimation(.spring(response: 0.6,
                                          dampingFraction: 0.8)) {
                        scaleFactor = 1 - (0.1 * ((value - defaultOffset) / 80))
                    }
                    
                    print("scaleFactor", scaleFactor)
                }
                
                if value <= defaultOffset {
                    withAnimation(.spring(response: 0.6,
                                          dampingFraction: 0.8)) {
                        scaleFactor = 1
                    }
                }

                if value - defaultOffset > 80 {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        isShow = false
                    }
                }
            }
            
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    isShow.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(Material.ultraThinMaterial, in: Circle() )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
        }
    }
    
    var cover: some View {
        VStack {
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image("illust")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
            Image("back")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        }
        .overlay {
            VStack(alignment: .leading, spacing: 12) {
                Text("Build an iOS app for iOS 15 with custom layouts, animations and ... ")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)
                Text("20 sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .padding(8)
                        .background(
                            Material.ultraThin, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    Text("Taught by Meng To")
                }
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(Material.ultraThin)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            .offset(y: 250)
            .padding(20)
        }
    }
}

#Preview {
    @Namespace var namespace
    return CourseView(namespace: namespace, isShow: .constant(true), dragOffset: .constant(.zero))
}
