//
//  AlertPresentableProtocol.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 16/02/2021.
//

import UIKit

protocol AlertPresentable {
    /// Show simple alert with Ok button
    /// - Parameter error: <#error description#>
    func showError(_ error: Error)
}

extension AlertPresentable where Self: UIViewController {
    func showError(_ error: Error) {
        let title = NSLocalizedString("Error", comment: "error alert title")
        let alert = UIAlertController(title: title,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(closeAction)
        present(alert, animated: true)
    }
}
