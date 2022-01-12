//
//  NetworkService.swift
//  goraTestTask
//
//  Created by Serega Kushnarev on 12.01.2022.
//

import Foundation

// MARK: - NetworkServiceProtocol

protocol NetworkServiceProtocol {
    
    func loadingUsers(completion: @escaping (Result<[User]?, Error>) -> Void)
    func loadingPhotos(completion: @escaping (Result<[Photo]?, Error>) -> Void)
}

// MARK: - NetworkService

class NetworkService: NetworkServiceProtocol {
    
    func loadingUsers(completion: @escaping (Result<[User]?, Error>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            print(data)
            
            do {
                let json = try JSONDecoder().decode([User].self, from: data)
                completion(.success(json))
                print(json)
            } catch {
                print(error)
            }
        } .resume()
    }
    
    func loadingPhotos(completion: @escaping (Result<[Photo]?, Error>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            print(data)
            
            do {
                let json = try JSONDecoder().decode([Photo].self, from: data)
                completion(.success(json))
                print(json)
            } catch {
                print(error)
            }
        } .resume()
    }
}


