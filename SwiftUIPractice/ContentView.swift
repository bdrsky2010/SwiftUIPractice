//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/2/24.
//

import SwiftUI

struct Genre: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
    let size: CGFloat
    var position: CGSize
}

struct ContentView: View {
    @State private var genres: [Genre] = []
    @State private var selectedGenres = Set<UUID>()
    
    let screenSize = UIScreen.main.bounds.size
    let circlePadding: CGFloat = 10
    
    var body: some View {
        ZStack {
            Color.primary
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Choose what you like")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
//                        .padding()
                    
                    
                    ZStack {
                        ForEach(genres) { genre in
                            Circle()
                                .fill(genre.color)
                                .stroke(Color.primary)
                                .frame(width: genre.size, height: genre.size)
                                .overlay(
                                    Text(genre.name)
                                        .foregroundColor(.black)
                                        .fontWeight(.bold)
                                )
                                .offset(genre.position)
                                .onTapGesture {
                                    if selectedGenres.contains(genre.id) {
                                        selectedGenres.remove(genre.id)
                                    } else {
                                        selectedGenres.insert(genre.id)
                                    }
                                }
                                .scaleEffect(selectedGenres.contains(genre.id) ? 1.1 : 1.0)
                                .animation(.easeInOut, value: selectedGenres.contains(genre.id))
                        }
                    }
                    .frame(width: screenSize.width * 0.9)
                    .frame(minHeight: screenSize.height * 2)
                    .padding()
                    .border(.white, width: 1)
                }
                
                Button {
                    
                } label: {
                    Text("DONE")
                }
                
            }
            .onAppear {
                generateGenres()
            }
        }
    }
    
    func generateGenres() {
        let genreNames = ["A 24", "Stanley Kubrick", "Tarantino", "Parasite", "Apocalypse Now", "Alfred Hitchcock",
                          "Big Lebowski", "Zombieland", "SNATCH", "The Godfather", "Drama", "Art House",
                          "Comedy", "Dystopia", "CLERKS", "Taika Waititi", "Gaspar Noe", "Horror", "Musical"]
        var newGenres: [Genre] = []
        
        for i in genreNames.indices {
            var newGenre: Genre
            var isOverlapping: Bool
            
            repeat {
                let size = CGFloat.random(in: 80...150)
                let randomX = CGFloat.random(in: (-screenSize.width / 2 + size / 2)...(screenSize.width / 2 - size / 2))
                let randomY = CGFloat.random(in: (-screenSize.height + size / 2)...(screenSize.height - size / 2))
                
                // 화면 밖으로 나가지 않도록 위치 조정
                let clampedX = max(-screenSize.width/2 + size/2, min(randomX, screenSize.width/2 - size/2))
                let clampedY = max(-screenSize.height + size/2, min(randomY, screenSize.height - size/2))
                
                let position = CGSize(width: clampedX, height: clampedY)
                
                // 파스텔톤의 랜덤 색상 설정
                let colors: [Color] = [
                    Color(red: 1.0, green: 0.6, blue: 0.6), // pastel red
                    Color(red: 0.6, green: 1.0, blue: 0.6), // pastel green
                    Color(red: 0.6, green: 0.6, blue: 1.0)  // pastel blue
                ]
                
                newGenre = Genre(name: genreNames[i], color: colors[i % 3], size: size, position: position)
                
                // 충돌 감지
                isOverlapping = newGenres.contains(where: { genre in
                    let distance = sqrt(pow(genre.position.width - newGenre.position.width, 2) + pow(genre.position.height - newGenre.position.height, 2))
                    return distance < (genre.size / 2 + newGenre.size / 2 + circlePadding)
                })
                
            } while isOverlapping
            
            newGenres.append(newGenre)
        }
        
        genres = newGenres
    }
}
