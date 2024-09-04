//
//  MyRandomImage.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/4/24.
//

import SwiftUI

struct MyRandomImageView: View {
    @State private var sections = [RandomSection]()
    
    var body: some View {
        NavigationWrapper {
            VStack {
                allSectionPart()
            }
            .padding(.vertical, 20)
            .navigationTitle("My Random Image")
        }
        .onAppear {
            sections = sectionDummy
        }
    }
    
    private func allSectionPart() -> some View {
        ScrollView {
            ForEach(sections, id: \.id) { section in
                sectionPart(section)
            }
        }
    }
    
    private func sectionPart(
        _ section: RandomSection
    ) -> some View {
        VStack(alignment: .leading) {
            Text(section.section.header)
                .font(.title3)
            horizontalImage(section: section)
        }
        .padding(.leading, 20)
    }
    
    private func horizontalImage(
        section: RandomSection
    ) -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(section.numbers, id: \.id) { number in
                    NavigationLink {
                        LazyView(
                            PushRandomImageView(
                                section: section.section,
                                number: number.number
                            )
                        )
                    } label: {
                        LazyView(
                            PosterView(
                                number: number.number,
                                type: .main)
                        )
                        .clipShape(.rect(cornerRadius: 20))
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 10)
    }
}

#Preview {
    MyRandomImageView()
}
