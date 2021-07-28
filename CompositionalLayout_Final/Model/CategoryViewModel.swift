//
//  CategoryViewModel.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 22.07.21.
//

import UIKit

struct CategoryViewModel: FixedSize {
    let height: CGFloat
    let width: CGFloat
    let headline: String
    let movies: [MovieCellViewModel]

    init(headline: String, movies: [MovieCellViewModel], height: CGFloat, width: CGFloat) {
        self.headline = headline
        self.movies = movies

        self.height = height
        self.width = width
    }
}
