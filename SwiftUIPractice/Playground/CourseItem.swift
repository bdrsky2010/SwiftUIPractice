//
//  CourseItem.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/12/24.
//

import SwiftUI

struct CourseItem: View {
    var namespace: Namespace.ID
    @Binding var isShow: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace, isSource: !isShow)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("20 sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace, isSource: !isShow)
                Text("Build an iOS app for iOS 15 with custom layouts, animations and ... ")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace, isSource: !isShow)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(Material.ultraThin)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace, isSource: !isShow)
            )
        }
        .foregroundStyle(.white)
        .background(
            Image("illust")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image", in: namespace, isSource: !isShow)
        )
        .background(
            Image("back")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace, isSource: !isShow)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace, isSource: !isShow)
        }
        .frame(height: 300)
        .padding(20)
    }
}

#Preview {
    @Namespace var namespace
    return CourseItem(namespace: namespace, isShow: .constant(true))
}
