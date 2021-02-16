//
//  MovieDetailsViewController.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import UIKit

final class MovieDetailsViewController: UIViewController, AlertPresentable {
    @IBOutlet var tableView: UITableView!
    var viewModel: MovieDetailsViewModel?
    
    override func viewDidLoad() {
        registerCells()
        viewModel?.delegate = self
        viewModel?.fetchDetails()
    }
    
    func registerCells() {
        let topCellName = TopMovieDetailsTableViewCell.name
        let topCellNib = UINib(nibName: topCellName, bundle: nil)
        tableView.register(topCellNib, forCellReuseIdentifier: topCellName)
        
        let middleCellName = MiddleMovieDetailsInfoTableViewCell.name
        let middleCellNib = UINib(nibName: middleCellName, bundle: nil)
        tableView.register(middleCellNib, forCellReuseIdentifier: middleCellName)
        
        let bottomCellName = BottomMovieDetailsInfoTableViewCell.name
        let bottomCellNib = UINib(nibName: bottomCellName, bundle: nil)
        tableView.register(bottomCellNib, forCellReuseIdentifier: bottomCellName)
    }
}

extension MovieDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieDetailCell.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // poster section
        if indexPath.row == MovieDetailCell.topPoster.row {
            let identifier = TopMovieDetailsTableViewCell.name
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TopMovieDetailsTableViewCell,
                  let movieDetails = viewModel?.movieDetails else {
                return UITableViewCell()
            }
            
            cell.setup(with: movieDetails)
            return cell
        }
        
        // info section
        if indexPath.row == MovieDetailCell.middleInfo.row {
            let identifier = MiddleMovieDetailsInfoTableViewCell.name
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MiddleMovieDetailsInfoTableViewCell,
                  let movieDetails = viewModel?.movieDetails else {
                return UITableViewCell()
            }

            cell.setup(with: movieDetails)
            return cell
        }
        
        // people section
        if indexPath.row == MovieDetailCell.bottomInfo.row {
            let identifier = BottomMovieDetailsInfoTableViewCell.name
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? BottomMovieDetailsInfoTableViewCell,
                  let movieDetails = viewModel?.movieDetails else {
                return UITableViewCell()
            }

            cell.setup(with: movieDetails)
            return cell
        }

        
        return UITableViewCell()
    }
}

extension MovieDetailsViewController: MovieDetailsViewModelDelegate {
    func updateDetails() {
        tableView.reloadData()
    }
}

extension MovieDetailsViewController {
    enum MovieDetailCell: Int, CaseIterable {
        case topPoster = 0
        case middleInfo = 1
        case bottomInfo = 2
        
        var row: Int {
            return rawValue
        }
    }
}
