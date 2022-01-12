//
//  PhotosTableViewCell.swift
//  goraTestTask
//
//  Created by Serega Kushnarev on 12.01.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    // MARK: - Public properties
    
    static let identifire = "PhotosTableViewCell"
    
    // MARK: - Private properties
    
    private let mainView = UIView()
    private let image = UIImageView()
    private let titleLabel = UILabel()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    // MARK: - Public methods
    
    func configuration(photo: Photo) {
        setUpTitleLabel(titleLabel, text: photo.title)
        setUpImage(image, imageName: photo.url)
    }
    
    // MARK: - Private methods
    
    private func setupCell() {
        setUpView(mainView)
    }
    
    private func setUpView(_ view: UIView) {
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.dropShadow()
        view.border()
        contentView.addSubview(view)
        createMainView(view)
    }
    
    private func setUpImage(_ image: UIImageView, imageName: String) {
        guard let url = URL(string: imageName) else { return }
        if let data = try? Data(contentsOf: url) { image.image = UIImage(data: data) }
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5
        mainView.addSubview(image)
        createImage(image)
    }
    
    private func setUpTitleLabel(_ label: UILabel, text: String) {
        label.numberOfLines = 0
        label.text = text
        mainView.addSubview(label)
        createLabel(label)
    }
}

// MARK: - Layout

extension PhotosTableViewCell {
    private func createMainView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    private func createLabel(_ label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
        label.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0).isActive = true
    }
    private func createImage(_ image: UIImageView) {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0).isActive = true
        image.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 0).isActive = true
        image.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 0).isActive = true
        image.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -5).isActive = true
    }
}

