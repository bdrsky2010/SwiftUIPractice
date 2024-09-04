//
//  MovieGenre.swift
//  SwiftUIPractice
//
//  Created by Minjae Kim on 9/4/24.
//

import Foundation

struct MovieGenre: Hashable, Identifiable {
    let id = UUID()
    let genre: String
    let movies: [MyMovie]
}

struct MyMovie: Hashable, Identifiable {
    let id = UUID()
    let title: String
}

let genreDummy = [
    MovieGenre(genre: "스릴러", movies: [
        MyMovie(title: "나쁜 녀석들: 라이드 오어 다이"),
        MyMovie(title: "트위스터스"),
        MyMovie(title: "구룡성채: 무법지대")
    ]),
    MovieGenre(genre: "스릴러", movies: [
        MyMovie(title: "콰이어트 플레이스: 첫째 날"),
        MyMovie(title: "에이리언: 커버넌트")
    ]),
    MovieGenre(genre: "로맨스", movies: [
        MyMovie(title: "타이타닉"),
        MyMovie(title: "미 비포 유"),
        MyMovie(title: "20세기 소녀"),
        MyMovie(title: "챌린저스")
    ]),
    MovieGenre(genre: "애니메이션", movies: [
        MyMovie(title: "인사이드 아웃 2"),
        MyMovie(title: "슈퍼배드 4"),
        MyMovie(title: "다람이 무비: 비키니 시티를 구하라"),
        MyMovie(title: "가필드 더 무비"),
        MyMovie(title: "쿵푸팬더 4"),
        MyMovie(title: "코렐라인: 비밀의 문")
    ]),
    MovieGenre(genre: "가족", movies: [
        MyMovie(title: "모아나 2"),
        MyMovie(title: "라이온 킹"),
        MyMovie(title: "웡카"),
        MyMovie(title: "그대들은 어떻게 살 것인가")
    ]),
    MovieGenre(genre: "SF", movies: [
        MyMovie(title: "데드풀과 울버린"),
        MyMovie(title: "에이리언: 로물루스"),
        MyMovie(title: "혹성탈출: 새로운 시대"),
        MyMovie(title: "퓨리오사: 매드맥스 사가"),
        MyMovie(title: "어벤져스: 인피니티 워"),
        MyMovie(title: "듄: 파트 2"),
        MyMovie(title: "스파이더맨: 노 웨이 홈"),
        MyMovie(title: "스파이더맨: 어크로스 더 유니버스"),
        MyMovie(title: "외계+인 1부")
    ]),
    MovieGenre(genre: "코미디", movies: [
        MyMovie(title: "나쁜 녀석들: 라이드 오어 다이"),
        MyMovie(title: "비틀쥬스 비틀쥬스"),
        MyMovie(title: "셀마 포스트의 화려한 외출"),
        MyMovie(title: "플라이 미 투 더 문"),
        MyMovie(title: "스턴트맨")
    ]),
]
