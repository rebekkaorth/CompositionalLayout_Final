//
//  TestData.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 21.07.21.
//

import Foundation
import UIKit

struct TestViewModel {
    static let searchViewModel: CategoryViewModel = CategoryViewModel(
        headline: TestData.search.type.name,
        movies: TestData.search.movies.map {
            MovieCellViewModel(movie: $0)
        },
        height: 220,
        width: UIScreen.main.bounds.width * 0.8
    )

    static let hotAndWorthItViewModel: CategoryViewModel = CategoryViewModel(
        headline: TestData.hotAndWorthIt.type.name,
        movies: TestData.hotAndWorthIt.movies.map {
            MovieCellViewModel(movie: $0)
        },
        height: 220,
        width: UIScreen.main.bounds.width * 0.8
    )

    static let continueWatchingViewModel: CategoryViewModel = CategoryViewModel(
        headline: TestData.continueWatching.type.name,
        movies: TestData.continueWatching.movies.map {
            MovieCellViewModel(movie: $0)
        },
        height: 280,
        width: 120
    )

    static let fromYourListViewModel: CategoryViewModel = CategoryViewModel(
        headline: TestData.fromYourList.type.name,
        movies: TestData.fromYourList.movies.map {
            MovieCellViewModel(movie: $0)
        },
        height: 110,
        width: 110
    )

    static let whatYouMightLikeViewModel: CategoryViewModel = CategoryViewModel(
        headline: TestData.whatYouMightLike.type.name,
        movies: TestData.whatYouMightLike.movies.map {
            MovieCellViewModel(movie: $0)
        },
        height: 300,
        width: UIScreen.main.bounds.width * 0.6
    )
}

struct TestData {
    static let search: Category = Category(
        type: .search,
        movies: [Movie(title: "Movie-1", imageUrl: "🔥")]
    )

    static let hotAndWorthIt: Category = Category(
        type: .hotAndWorthIt,
        movies: [
            Movie(title: "Movie-1", imageUrl: "🔥"),
            Movie(title: "Movie-2", imageUrl: "🙏"),
            Movie(title: "Movie-3", imageUrl: "😎"),
            Movie(title: "Movie-4", imageUrl: "😁"),
            Movie(title: "Movie-5", imageUrl: "🚀"),
            Movie(title: "Movie-6", imageUrl: "🐊"),
            Movie(title: "Movie-7", imageUrl: "😇"),
            Movie(title: "Movie-8", imageUrl: "😕"),
            Movie(title: "Movie-9", imageUrl: "🧐")
        ]
    )

    static let continueWatching: Category = Category(
        type: .continueWatching,
        movies: [
            Movie(title: "Movie-1", imageUrl: "🥺"),
            Movie(title: "Movie-2", imageUrl: "😳"),
            Movie(title: "Movie-3", imageUrl: "🤫"),
            Movie(title: "Movie-4", imageUrl: "🤥"),
            Movie(title: "Movie-5", imageUrl: "😶‍🌫️"),
            Movie(title: "Movie-6", imageUrl: "🥸"),
            Movie(title: "Movie-7", imageUrl: "😰"),
            Movie(title: "Movie-8", imageUrl: "😧"),
            Movie(title: "Movie-9", imageUrl: "🥴")
        ]
    )

    static let fromYourList: Category = Category(
        type: .fromYourList,
        movies: [
            Movie(title: "Movie-1", imageUrl: "🙏"),
            Movie(title: "Movie-2", imageUrl: "🙆‍♀️"),
            Movie(title: "Movie-3", imageUrl: "🙅‍♂️"),
            Movie(title: "Movie-4", imageUrl: "🧏‍♀️"),
            Movie(title: "Movie-5", imageUrl: "🧚‍♂️"),
            Movie(title: "Movie-6", imageUrl: "🧝"),
            Movie(title: "Movie-7", imageUrl: "🧛"),
            Movie(title: "Movie-8", imageUrl: "🎅"),
            Movie(title: "Movie-9", imageUrl: "👯")
        ]
    )

    static let whatYouMightLike: Category = Category(
        type: .whatYouMightLike,
        movies: [
            Movie(title: "Movie-1", imageUrl: "📽"),
            Movie(title: "Movie-2", imageUrl: "📽"),
            Movie(title: "Movie-3", imageUrl: "📽"),
            Movie(title: "Movie-4", imageUrl: "📽"),
            Movie(title: "Movie-5", imageUrl: "📽")
        ]
    )
}
