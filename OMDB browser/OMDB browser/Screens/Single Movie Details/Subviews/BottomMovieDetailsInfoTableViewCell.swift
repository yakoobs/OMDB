//
//  BottomMovieDetailsInfoTableViewCell.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 16/02/2021.
//

import UIKit

final class BottomMovieDetailsInfoTableViewCell: UITableViewCell {
    static let name = "BottomMovieDetailsInfoTableViewCell"
    
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    
    func setup(with movieDetails: MovieDetails) {
        directorLabel.text = movieDetails.director
        writerLabel.text = movieDetails.writer
        actorsLabel.text = movieDetails.actors
    }
}
