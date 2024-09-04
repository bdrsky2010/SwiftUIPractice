//
//  ProfileSettingView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/2/24.
//

import SwiftUI

struct MBTI: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let index: Int
    var foreground: Color = .black
    var background: Color = .white
}

struct ProfileSettingView: View {
    @State private var selectedIndex = Int.random(in: 0...11)
    @State private var nickname = ""
    @State private var selectedMBTI = Array(repeating: "", count: 4)
    @State private var list = [
        [
            MBTI(title: "E", index: 0),
            MBTI(title: "S", index: 1),
            MBTI(title: "T", index: 2),
            MBTI(title: "J", index: 3)
        ],
        [
            MBTI(title: "I", index: 0),
            MBTI(title: "N", index: 1),
            MBTI(title: "F", index: 2),
            MBTI(title: "P", index: 3),
        ]
    ]
    
    var body: some View {
        NavigationLink {
            ProfileImageSettingView(selectedIndex: $selectedIndex)
        } label: {
            ProfileImageView(imageIndex: selectedIndex, size: 100, selectType: .selected)
        }
        .padding(.vertical, 20)
        
        TextField("닉네임을 입력해라", text: $nickname)
            .padding(.horizontal, 20)
        
        Rectangle()
            .frame(height: 1)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .foregroundStyle(.gray)
        
        HStack(alignment: .top) {
            Text("MBTI")
            Spacer()
            mbtiSection()
        }
        .padding(20)
        
        Spacer()
        
        NavigationLink("완료") {
            CompleteView()
        }
        .asBlueCapsule(background: !nickname.isEmpty && !selectedMBTI.contains("") ? .blue : .gray)
        .disabled(!nickname.isEmpty && !selectedMBTI.contains("") ? false : true)
        .navigationTitle("PROFILE SETTING")
        .onChange(of: selectedMBTI) { _, _ in
            changeColor()
        }
    }
    
    private func mbtiSection() -> some View {
        VStack {
            ForEach(0..<2) { i in
                HStack {
                    ForEach(list[i], id: \.id) { mbti in
                        Text("\(mbti.title)")
                            .frame(width: 50, height: 50)
                            .foregroundStyle(mbti.foreground)
                            .background(mbti.background)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                            .onTapGesture {
                                if selectedMBTI[mbti.index] == mbti.title {
                                    selectedMBTI[mbti.index] = ""
                                } else {
                                    selectedMBTI[mbti.index] = mbti.title
                                }
                            }
                    }
                }
            }
        }
    }
    
    private func changeColor() {
        for i in 0...3 {
            list[0][i].foreground = list[0][i].title == selectedMBTI[i] ? .white : .black
            list[0][i].background = list[0][i].title == selectedMBTI[i] ? .blue : .white
            
            list[1][i].foreground = list[1][i].title == selectedMBTI[i] ? .white : .black
            list[1][i].background = list[1][i].title == selectedMBTI[i] ? .blue : .white
        }
    }
}

#Preview {
    ProfileSettingView()
}
