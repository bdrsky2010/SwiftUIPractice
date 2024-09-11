//
//  MatchedView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/11/24.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State private var isShow = false
    
    var body: some View {
        ZStack {
            if !isShow {
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 12) {
                        Text("SwiftUI")
                            .font(.largeTitle.weight(.bold))
                            .matchedGeometryEffect(id: "title", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("20 sections - 3 hours".uppercased())
                            .font(.footnote.weight(.semibold))
                            .matchedGeometryEffect(id: "subtitle", in: namespace)
                        Text("Build an iOS app for iOS 15 with custom layouts, animations and ... ")
                            .font(.footnote)
                            .matchedGeometryEffect(id: "text", in: namespace)
                    }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(Material.ultraThin)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: "blur", in: namespace)
                    )
                }
                .foregroundStyle(.white)
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
                .frame(height: 300)
                .padding(20)
            } else {
                ScrollView {
                    VStack {
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
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
                        }
                        .padding(20)
                        .background(
                            Rectangle()
                                .fill(Material.ultraThin)
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .matchedGeometryEffect(id: "blur", in: namespace)
                        )
                        .offset(y: 100)
                    }
                    .frame(height: 500)
                    .padding(20)
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
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isShow.toggle()
            }
        }
    }
}

#Preview {
    MatchedView()
}
