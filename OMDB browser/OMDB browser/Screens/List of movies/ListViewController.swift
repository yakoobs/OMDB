//
//  ListViewController.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import UIKit

final class ListViewController: UIViewController, AlertPresentable {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = ListViewModel()
    private let showDetailsSegueId = "showDetails"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Film list", comment: "List screen title")
        viewModel.delegate = self
        registerCell()
    }
    
    private func registerCell() {
        let cellName = MovieListCollectionViewCell.name
        let nib = UINib(nibName: cellName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? MovieDetailsViewController,
           let selectedMovieId = viewModel.selectedItem?.imdbID {
            let viewModel = MovieDetailsViewModel(movieId: selectedMovieId)
            viewController.viewModel = viewModel
        }
    }
}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.resultsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = MovieListCollectionViewCell.name
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MovieListCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let movie = viewModel.movies?[indexPath.item] {
            cell.setup(with: movie)
        }
        return cell
    }
}

extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedMovie = viewModel.movies?[indexPath.item] {
            viewModel.selectedItem = selectedMovie
            performSegue(withIdentifier: showDetailsSegueId, sender: nil)
        }
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let padding: CGFloat = 40
          let collectionViewSize = collectionView.frame.size.width - padding
          return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
      }
}

extension ListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            viewModel.search(for: query)
        }
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}

extension ListViewController: ListViewModelDelegate {
    func updateResults() {
        collectionView.reloadData()
    }
}
