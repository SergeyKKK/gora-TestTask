//
//  PhotosModel.swift
//  goraTestTask
//
//  Created by Serega Kushnarev on 12.01.2022.
//

import Foundation

// MARK: - Photo

struct Photo: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
