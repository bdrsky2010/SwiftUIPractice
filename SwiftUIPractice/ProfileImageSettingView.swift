//
//  ProfileImageSettingView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/2/24.
//

import SwiftUI

struct ProfileImage: Hashable, Identifiable {
    let id = UUID()
    let imageIndex: Int
}

struct ProfileImageSettingView: View {
    @Binding var selectedIndex: Int
    
    var profileImages = (0...2).map { i in
        (0...3).map { j in
            ProfileImage(imageIndex: (i * 4) + j)
        }
    }
    
    var body: some View {
        ProfileImageView(imageIndex: selectedIndex, size: 100, selectType: .selected)
            .padding()
        ForEach(0..<3) { i in
            HStack {
                ForEach(profileImages[i], id: \.id) { profile in
                    ProfileImageView(
                        imageIndex: profile.imageIndex,
                        size: 80,
                        selectType: profile.imageIndex == selectedIndex ? .select : .unselect
                    )
                    .onTapGesture {
                        selectedIndex = profile.imageIndex
                    }
                }
            }
        }
        .padding(10)
        .navigationTitle("PROFILE SETTING")
        Spacer()
    }
}

#Preview {
    ProfileImageSettingView(selectedIndex: .constant(2))
}
