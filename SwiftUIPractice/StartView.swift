//
//  StartView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/2/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationWrapper {
            VStack {
                Spacer()
                Image("launch_phrase")
                Spacer()
                Image("launch_Image")
                Spacer()
                NavigationLink("시작하기") {
                    ProfileSettingView()
                }
                .asBlueCapsule(background: .blue)
            }
        }
    }
}

#Preview {
    StartView()
}
