//
//  MiddleMovieDetailsInfoTableViewCell.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 16/02/2021.
//

import UIKit

final class MiddleMovieDetailsInfoTableViewCell: UITableViewCell {
    static let name = "MiddleMovieDetailsInfoTableViewCell"
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var imdbRatingLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
 
    func setup(with movieDetails: MovieDetails) {
        genreLabel.text = movieDetails.genre
        runtimeLabel.text = movieDetails.runtime
        imdbRatingLabel.text = movieDetails.imdbRating
        plotLabel.text = movieDetails.plot
        scoreLabel.text = movieDetails.imdbRating
        reviewsLabel.text = movieDetails.metascore
        popularityLabel.text = movieDetails.imdbVotes
    }
}
