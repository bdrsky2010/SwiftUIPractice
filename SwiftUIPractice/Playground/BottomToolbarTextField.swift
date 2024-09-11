//
//  BottomToolbarTextField.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/11/24.
//

import SwiftUI

struct BottomToolbarTextField: View {
    @State private var text = ""
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    
                }
            }
        }
        Spacer()
        VStack {
            HStack(alignment: .bottom) {
                TextField(
                    "입력해봐",
                    text: $text,
                    prompt: Text("안녕")
                        .foregroundStyle(.red),
                    axis: .vertical
                )
                .lineLimit(3)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.trailing, 4)
                .padding(.bottom, 4)
            }
            .background(.yellow)
            .clipShape(.rect(cornerRadius: 20))
        }
        .padding(.bottom, 8)
        .padding(.horizontal)
    }
}

#Preview {
    BottomToolbarTextField()
}
