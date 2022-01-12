//
//  UsersTableViewCell.swift
//  goraTestTask
//
//  Created by Serega Kushnarev on 12.01.2022.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    // MARK: - Public properties
    
    static let identifire = "UsersTableViewCell"
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.textLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

