//
//  MovieCategoryView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/4/24.
//

import SwiftUI

struct MovieCategoryView: View {
    @State private var text = ""
    @State private var genreList = [MovieGenre]()
    
    var body: some View {
        NavigationWrapper {
            genreListPart()
            .navigationTitle("영화 검색")
            .toolbar {
                ToolbarItem {
                    Button("추가") {
                        guard !text.isEmpty else { return }
                        genreList.append(.init(genre: text, movies: []))
                    }
                }
            }
        }
        .onAppear {
            genreList = genreDummy
        }
    }
    
    private func genreListPart() -> some View {
        List {
            ForEach(genreList, id: \.id) { genre in
                NavigationLink {
                    
                } label: {
                    LazyView(genreRow(genre: genre))
                }
            }
        }
        .searchable(text: $text, prompt: "영화를 검색해보세요.")
        .onSubmit(of: .search) {
            guard !text.isEmpty else { return }
            genreList.append(.init(genre: text, movies: []))
        }
    }
    
    private func genreRow(genre: MovieGenre) -> some View {
        HStack {
            Image(systemName: "person")
            Text("\(genre.genre)(\(genre.movies.count))")
            Spacer()
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    MovieCategoryView()
}
