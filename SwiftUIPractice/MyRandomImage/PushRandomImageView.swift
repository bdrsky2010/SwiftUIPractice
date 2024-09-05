//
//  PushRandomImageView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/4/24.
//

import SwiftUI

struct PushRandomImageView: View {
    @Binding var section: RandomSection
    private let number: Int
    
    init(section: Binding<RandomSection>, number: Int) {
        self._section = section
        self.number = number
    }
    
    var body: some View {
        PosterView(number: number, type: .detail)
        TextField("섹션 이름을 입력해주세요", text: $section.header)
            .padding()
            .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    PushRandomImageView(section: .constant(.init(header: "첫번째 섹션", numbers: [])), number: 1)
}
