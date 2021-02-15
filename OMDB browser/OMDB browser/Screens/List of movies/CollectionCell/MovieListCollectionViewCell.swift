//
//  MovieListCollectionViewCell.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import UIKit

final class MovieListCollectionViewCell: UICollectionViewCell {
    
    static let name = "MovieListCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with movie: MovieBasicInfo) {
        imageView.downloaded(from: movie.poster)
        titleLabel.text = movie.title + " (\(movie.year))"
    }
}
