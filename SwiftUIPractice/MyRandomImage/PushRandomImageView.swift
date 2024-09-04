//
//  PushRandomImageView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/4/24.
//

import SwiftUI

struct PushRandomImageView: View {
    private let section: RandomSectionType
    private let number: Int
    
    init(section: RandomSectionType, number: Int) {
        self.section = section
        self.number = number
    }
    
    var body: some View {
        PosterView(number: number, type: .detail)
        Text(section.header)
    }
}

#Preview {
    PushRandomImageView(section: .one, number: 1)
}
