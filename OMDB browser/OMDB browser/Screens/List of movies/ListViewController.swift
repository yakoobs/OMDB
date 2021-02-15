//
//  ListViewController.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import UIKit

final class ListViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Film list", comment: "List screen title")
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}
