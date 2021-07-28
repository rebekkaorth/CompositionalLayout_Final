//
//  MovieCellViewModel.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 22.07.21.
//

import UIKit

struct MovieCellViewModel {
    let movieTitle: String
    let movieImageUrl: String?

    init(movie: Movie) {
        self.init(movieTitle: movie.title, movieImageUrl: movie.imageUrl)
    }

    init(movieTitle: String, movieImageUrl: String?) {
        self.movieTitle = movieTitle
        self.movieImageUrl = movieImageUrl
    }
}
