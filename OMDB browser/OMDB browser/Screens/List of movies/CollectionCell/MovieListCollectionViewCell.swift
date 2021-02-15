//
//  MovieListCollectionViewCell.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import UIKit

class MovieListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with movie: MovieBasicInfo) {
        imageView.image =
        titleLabel.text = movie.title + "(\(movie.year)"
    }
}
