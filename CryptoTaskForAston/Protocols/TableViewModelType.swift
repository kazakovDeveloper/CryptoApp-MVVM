//
//  TableViewModelType.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 09.12.2022.
//

import Foundation

protocol TableViewViewModelType {
    var numberOfRows: Int { get }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
}
