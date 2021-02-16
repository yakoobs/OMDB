//
//  AlertPresentableProtocol.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 16/02/2021.
//

import UIKit

protocol AlertPresentable {
    func showError(_ error: Error)
}

extension AlertPresentable where Self: UIViewController {
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(closeAction)
        present(alert, animated: true)
    }
}
