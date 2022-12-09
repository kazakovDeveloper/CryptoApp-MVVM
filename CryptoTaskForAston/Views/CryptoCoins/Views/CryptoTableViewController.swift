//
//  TableViewController.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 16.11.2022.
//

import UIKit

class CryptoTableViewController: UIViewController {
    
    
    var viewModel: TableViewViewModelType?
    
    //MARK: - UI
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        return activityIndicator
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoCell.self,
                           forCellReuseIdentifier: CryptoCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        setupNavBar()
        
        viewModel = ViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
  
    
    
    func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                            target: self,
                                                            action: #selector(logOut))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func logOut() {
        self.view.window!.rootViewController = LoginViewController()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
}
