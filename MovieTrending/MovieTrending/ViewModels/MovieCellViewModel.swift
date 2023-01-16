//
//  MovieCellViewModel.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/16/23.
//

import Foundation

class MovieCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: MoviesResult) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage) / 10"
        
    }
}
