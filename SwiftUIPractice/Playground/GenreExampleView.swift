//
//  GenreExampleView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/12/24.
//

import SwiftUI

struct Temp: Hashable, Identifiable {
    let id: Int
    let name: String
    
    static let dummy = [
        Temp(id: 28, name: "Action"),
        Temp(id: 12, name: "Adventure"),
        Temp(id: 16, name: "Animation"),
        Temp(id: 35, name: "Comedy"),
        Temp(id: 80, name: "Crime"),
        Temp(id: 99, name: "Documentary"),
        Temp(id: 18, name: "Drama"),
        Temp(id: 10751, name: "Family"),
        Temp(id: 14, name: "Fantasy"),
        Temp(id: 36, name: "History"),
        Temp(id: 27, name: "Horror"),
        Temp(id: 10402, name: "Music"),
        Temp(id: 9648, name: "Mystery"),
        Temp(id: 10749, name: "Romance"),
        Temp(id: 878, name: "Science Fiction"),
        Temp(id: 10770, name: "TV Movie"),
        Temp(id: 53, name: "Thriller"),
        Temp(id: 10752, name: "War"),
        Temp(id: 37, name: "Western")
    ]
}

struct GenreExampleView: View {
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    private let genreNames = Temp.dummy
        .sorted { $0.name < $1.name }
    @State private var selectedGenres: Set<Temp> = []
    @State private var selectedGenreRows: [[Temp]] = []
    
    var body: some View {
        ScrollView {
            Text("Choose What You Like")
                .font(.largeTitle.bold())
            LazyVGrid(columns: columns) {
                ForEach(genreNames, id: \.id) { genre in
                    Circle()
                        .fill(selectedGenres.contains(genre) ? Color(uiColor: .button) : Color(uiColor: .button).opacity(0.3))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Text(genre.name)
                                .foregroundStyle(selectedGenres.contains(genre) ? .white : Color(uiColor: .button))
                                .multilineTextAlignment(.center)
                                .padding(8)
                        )
                        .onTapGesture {
                            withAnimation {
                                if selectedGenres.contains(genre) {
                                    selectedGenres.remove(genre)
                                } else {
                                    selectedGenres.insert(genre)
                                }
                            }
                            
                        }
                }
            }
            
            Rectangle()
                .fill(.clear)
                .frame(height: 200)
        }
        .sheet(isPresented: .constant(true)) {
            VStack {
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 15) {
                        ForEach(selectedGenreRows, id: \.self) { row in
                            HStack(spacing: 12) {
                                ForEach(row, id: \.id) { tag in
                                    SelectedGenreView(selectedGenres: $selectedGenres, genre: tag)
                                }
                            }
                        }
                    }
                }
                .frame(width: TagHandler.windowWidth)

                Button {
                    
                } label: {
                    Text("Done")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(uiColor: .button).opacity(0.3))
                        .foregroundStyle(Color(uiColor: .button))
                }
            }
            .padding()
            .presentationDetents([.height(200)])
            .presentationBackgroundInteraction(.enabled(upThrough: .height(200)))
            .presentationCornerRadius(0)
            .presentationDragIndicator(.visible)
            .interactiveDismissDisabled()
        }
        .onChange(of: selectedGenres) { _ in
            selectedGenreRows = TagHandler.getRows(tags: selectedGenres, spacing: 40, fontSize: 16, windowWidth: TagHandler.windowWidth)
        }
    }
}

struct SelectedGenreView: View {
    @Binding var selectedGenres: Set<Temp>
    let genre: Temp
    
    var body: some View {
        Text(genre.name)
            .padding(10)
            .foregroundStyle(.white)
            .background(Color.init(uiColor: .button))
            .clipShape(Capsule())
            .onTapGesture {
                withAnimation(.easeInOut) {
                    let _ = selectedGenres.remove(genre)
                }
            }
    }
}

#Preview {
    GenreExampleView()
}
