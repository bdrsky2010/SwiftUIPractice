//
//  RandomSection.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/4/24.
//

import Foundation

enum RandomSectionType: Int, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    
    var header: String {
        switch self {
        case .one:   return "첫번째 섹션"
        case .two:   return "두번째 섹션"
        case .three: return "세번째 섹션"
        case .four:  return "네번째 섹션"
        case .five:  return "다섯번째 섹션"
        }
    }
}

struct RandomSection: Hashable, Identifiable {
    let id = UUID()
    let section: RandomSectionType
    let numbers: [RandomNumber]
}

struct RandomNumber: Hashable, Identifiable {
    let id = UUID()
    let number: Int
}

let sectionDummy = RandomSectionType.allCases.map {
    RandomSection(
        section: $0, numbers: (0...10).map { _ in
            RandomNumber(number: Int.random(in: 1...100))
        }
    )
}
