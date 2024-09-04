//
//  RandomPosterView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/4/24.
//

import SwiftUI

enum PosterUseType {
    case main
    case detail
}

struct PosterView: View {
    private let number: Int
    private let type: PosterUseType
    
    private var width: CGFloat {
        switch type {
        case .main:   return 100
        case .detail: return 200
        }
    }
    
    private var height: CGFloat {
        switch type {
        case .main:   return 150
        case .detail: return 300
        }
    }
    
    init(number: Int, type: PosterUseType) {
        self.number = number
        self.type = type
    }
    
    var body: some View {
        AsyncImage(url: URL(
            string: "https://picsum.photos/id/\(number)/200/300")
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
            case .success(let image):
                image
                    .resizable()
                    .frame(width: width, height: height)
            case .failure(_):
                Image(systemName: "star")
                    .resizable()
                    .frame(width: width, height: height)
                    .background(.yellow)
            @unknown default:
                ProgressView()
                    .frame(width: width, height: height)
            }
        }
    }
}

#Preview {
    PosterView(number: Int.random(in: 1...100), type: .main)
}
