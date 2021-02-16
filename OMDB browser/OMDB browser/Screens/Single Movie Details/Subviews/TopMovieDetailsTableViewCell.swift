//
//  TopMovieDetailsTableViewCell.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 16/02/2021.
//

import UIKit

final class TopMovieDetailsTableViewCell: UITableViewCell {
    static let name = "TopMovieDetailsTableViewCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    func setup(with movieDetails: MovieDetails) {
        posterImageView.downloaded(from: movieDetails.poster)
        titleLabel.text = movieDetails.title
        yearLabel.text = "(\(movieDetails.year))"
    }
}
