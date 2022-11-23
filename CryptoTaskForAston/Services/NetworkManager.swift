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
    
    private struct Constants{
        static let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=25&page=1&sparkline=false&price_change_percentage=24h"
    }
    
    private init() {}
    
    public func getAllCryptoData(completion: @escaping (Result<[CryptoCoin], Error>) -> Void) {
        guard let url = URL(string: Constants.url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let cryptoCoins = try JSONDecoder().decode([CryptoCoin].self, from: data)
                completion(.success(cryptoCoins))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
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
        if let cachedImage = ImageCacheManager.shared.object(forKey: url.lastPathComponent as NSString) {
            completion(.success(cachedImage))
            return
        }
        fetchImage(from: url) { result in
            switch result {
            case .success(let image):
                guard let uiImage = UIImage(data: image) else { return }
                ImageCacheManager.shared.setObject(uiImage, forKey: url.lastPathComponent as NSString)
                print("Image from network: ", url.lastPathComponent)
                completion(.success(uiImage))
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
}
