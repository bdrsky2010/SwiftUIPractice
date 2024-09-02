//
//  StartView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/2/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("launch")
                Spacer()
                Image("launchImage")
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
