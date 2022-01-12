//
//  UsersViewController.swift
//  goraTestTask
//
//  Created by Serega Kushnarev on 12.01.2022.
//

import UIKit

// MARK: - UsersViewController

final class UsersViewController: BaseViewController {
    
    // MARK: - private properties
    
    private let usersTableView = UITableView()
    private let networkService = NetworkService()
    private let photosViewController = PhotosViewController()
    
    private var userArray: [User] = []
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getUsers()
    }
    
    // MARK: - Private methods
    
    private func setUpView() {
        view.backgroundColor = .white
        navigationItem.title = "Users"
        setUpUsersTableView(usersTableView)
    }
    
    private func setUpUsersTableView(_ tableView: UITableView) {
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersTableViewCell.identifire)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        createUsersTableView(tableView)
    }
    
    private func getUsers() {
        networkService.loadingUsers { result in
            switch result {
            case .success(let user):
                if let user = user {
                    DispatchQueue.main.async {
                        self.userArray = user
                        self.usersTableView.reloadData()
                    }
                }
            case .failure(_):
                self.showAlertError(text: "Check Connection")
            }
        }
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate

extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifire,
                                                    for: indexPath) as? UsersTableViewCell {
            let user = userArray[indexPath.row]
            
            cell.textLabel?.text = user.name
            cell.selectionStyle = .none
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(photosViewController, animated: true)
    }
}

// MARK: - Layout

extension UsersViewController {
    private func createUsersTableView(_ tableView: UITableView) {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

