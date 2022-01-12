//
//  PhotosViewController.swift
//  goraTestTask
//
//  Created by Serega Kushnarev on 12.01.2022.
//

import UIKit

// MARK: - PhotosViewController

final class PhotosViewController: BaseViewController {
    
    // MARK: - private properties
    
    private let photosTableView = UITableView()
    private let networkService = NetworkService()
    private let activityLoadingIndicator = UIActivityIndicatorView(style: .medium)
    
    private var photoArray: [Photo] = []
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getPhotos()
    }
    
    // MARK: - Private methods
    
    private func setUpView() {
        view.backgroundColor = .white
        navigationItem.title = "Photos"
        setUpPhotosTableView(photosTableView)
        setUpActivityLoadingIndicator(activityLoadingIndicator)
    }
    
    private func setUpPhotosTableView(_ tableView: UITableView) {
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifire)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = view.bounds.height / 2
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        createUsersTableView(tableView)
    }
    
    private func setUpActivityLoadingIndicator(_ indicator: UIActivityIndicatorView) {
        indicator.startAnimating()
        view.addSubview(indicator)
        creteActivityLoadingIndicator(indicator)
    }
    
    private func getPhotos() {
        networkService.loadingPhotos { result in
            switch result {
            case .success(let photo):
                if let photo = photo {
                    DispatchQueue.main.async {
                        self.photoArray = photo
                        self.photosTableView.reloadData()
                        self.activityLoadingIndicator.stopAnimating()
                    }
                }
            case .failure(_):
                self.showAlertError(text: "Check Connection")
                self.activityLoadingIndicator.stopAnimating()
            }
        }
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate

extension PhotosViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifire,
                                                    for: indexPath) as? PhotosTableViewCell {
            
            let photo = photoArray[indexPath.row]
            
            cell.selectionStyle = .none
            cell.configuration(photo: photo)
            
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - Layout

extension PhotosViewController {
    private func createUsersTableView(_ tableView: UITableView) {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    private func creteActivityLoadingIndicator(_ indicator: UIActivityIndicatorView) {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}


