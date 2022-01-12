//
//  Alert.swift
//  goraTestTask
//
//  Created by Serega Kushnarev on 12.01.2022.
//

import UIKit

final class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAlert()
    }
    
    func showAlertInternetConnection() {
      let alert = UIAlertController(title: nil, message: "Проверьте подключение", preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .default) { (action) in }
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
  }
}
