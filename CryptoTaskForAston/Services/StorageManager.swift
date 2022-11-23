//
//  UserCache.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 22.11.2022.
//

import Foundation

struct StorageManager {
    
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    private let accountKey = "AccountKey"
    
    private init() {}
    
    func save(user: Account) {
        defaults.set(try? PropertyListEncoder().encode(user), forKey: accountKey)
    }
    
    func fetchAccount() -> Account? {
        if let data = defaults.value(forKey: accountKey) as? Data  {
            guard let accountData = try? PropertyListDecoder().decode(Account.self, from: data) else { return nil }
            return accountData
        }
        return nil
    }
    func deleteAccount() {
        let currentAccount = fetchAccount()
        
        print("Your account \(currentAccount) was deleted")
        
        defaults.set(nil, forKey: accountKey)
    }
    }


