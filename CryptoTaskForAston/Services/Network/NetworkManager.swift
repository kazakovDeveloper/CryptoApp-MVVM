//
//  ApiCaller.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 16.11.2022.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    public func getAllCoinsData(completion: @escaping (Result<[String:CryptoCoin], Error>) -> Void ) {
        NetworkConstant.coinNames.allCases.forEach { names in
            guard let url = URL(string: names.coinURL) else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
                guard let data = dataResponse, error == nil else {
                    return
                    
                }
                do {
                    let resultData = try JSONDecoder().decode([String:CryptoCoin].self, from: data)
                    completion(.success(resultData ))
                }
                catch {
                    completion(.failure(NetworkError.noData))
                }
            }
            .resume()
            }
    }
        
    func fetchImage(from url: URL?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = url else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
        
    }
    
    func saveImage(from url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {
        if let cachedImage = ImageCacheManager.shared.object(forKey: url.absoluteString as NSString) {
            completion(.success(cachedImage))
            return
        }
        fetchImage(from: url) { result in
            switch result {
            case .success(let image):
                guard let uiImage = UIImage(data: image) else { return }
                ImageCacheManager.shared.setObject(uiImage, forKey: url.absoluteString as NSString)
                completion(.success(uiImage))
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
}
