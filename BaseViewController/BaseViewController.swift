//
//  Alert.swift
//  goraTestTask
//
//  Created by Serega Kushnarev on 12.01.2022.
//

import UIKit

class BaseViewController: UIViewController {
    func showAlertError(text: String) {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
