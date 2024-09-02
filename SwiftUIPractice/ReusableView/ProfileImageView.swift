//
//  ProfileImageView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/2/24.
//

import SwiftUI

enum ProfileImageSelectType {
    case selected
    case select
    case unselect
}

struct ProfileImageView: View {
    let imageIndex: Int
    let size: CGFloat
    let selectType: ProfileImageSelectType
    
    var body: some View {
        Image("profile_\(imageIndex)")
            .resizable()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay {
                ZStack(alignment: .bottomTrailing) {
                    Circle()
                        .stroke(lineWidth: selectType == .selected ? 4 : 3)
                        .foregroundStyle(selectType == .unselect ? .gray : .blue)
                    if selectType == .selected {
                        Image(systemName: "camera.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white, .blue)
                    }
                }
            }
            .opacity(selectType == .unselect ? 0.6 : 1)
    }
}

#Preview {
    ProfileImageView(imageIndex: 0, size: 100, selectType: .select)
}
