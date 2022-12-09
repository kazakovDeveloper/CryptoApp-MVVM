//
//  CoinTableViewController+Extension.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 30.11.2022.
//

import Foundation
import UIKit

extension CryptoTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCell.identifier,
                                                       for: indexPath) as? CryptoCell else {
                                                       return UITableViewCell() }
        guard let viewModel = viewModel else { return UITableViewCell() }
        
        let coin = viewModel.coins[indexPath.row]
        
        cell.selectionStyle = .none
        return cell
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
