//
//  HeroAnimationView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/11/24.
//

import SwiftUI

struct HeroAnimationView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<20) { i in
                        Rectangle()
                            .fill(.green)
                            .padding(.horizontal, 10)
                            .frame(width: geometry.size.width * 0.8,
                                   height: geometry.size.height * 0.6)   
                    }
                }
            }
            .frame(width: geometry.size.width,
                   height: geometry.size.height * 0.6)
        }
    }
}

struct EmptyView: View {
    var body: some View {
        Color.blue
    }
}

#Preview {
    HeroAnimationView()
}
