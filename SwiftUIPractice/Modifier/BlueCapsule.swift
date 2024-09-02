//
//  BlueCapsule.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/2/24.
//

import SwiftUI

fileprivate struct BlueCapsule: ViewModifier {
    let backgroud: Color
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(backgroud)
            .clipShape(Capsule())
            .padding(.horizontal, 20)
    }
}

extension View {
    func asBlueCapsule(background: Color) -> some View {
        modifier(BlueCapsule(backgroud: background))
    }
}
