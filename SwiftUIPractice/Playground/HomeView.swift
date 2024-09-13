//
//  HomeView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/12/24.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State private var isShow = false
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color.indigo.opacity(0.8).ignoresSafeArea()
            ScrollView {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .frame(height: 300)
                    .padding()
                
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .frame(height: 300)
                    .padding()
                
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .frame(height: 300)
                    .padding()
                
                CourseItem(namespace: namespace, isShow: $isShow)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            isShow.toggle()
                        }
                    }
                
            }

            if isShow {
                CourseView(namespace: namespace, isShow: $isShow, dragOffset: $dragOffset)
            }
        }
    }
}

#Preview {
    HomeView()
}
