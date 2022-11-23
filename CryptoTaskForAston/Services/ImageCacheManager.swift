//
//  ImageCacheManager.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 22.11.2022.
//

import UIKit

class ImageCacheManager {
    
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
    
}
