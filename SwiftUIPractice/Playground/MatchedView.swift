//
//  MatchedView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/11/24.
//

import SwiftUI

struct MatchedView: View {
    var namespace: Namespace.ID
    @Binding var isShow: Bool
    
    var body: some View {
        ZStack {
            if !isShow {
                CourseItem(namespace: namespace, isShow: $isShow)
            } else {
//                CourseView(namespace: namespace, isShow: $isShow)
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
    @Namespace var namespace
    return MatchedView(namespace: namespace, isShow: .constant(true))
}
