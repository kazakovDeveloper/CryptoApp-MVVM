//
//  TableViewController.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 16.11.2022.
//

import UIKit

class TableViewController: UIViewController {

    //MARK: - UI ELEMENTS
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    private var dataSource: CryptoTableViewDataSource<CustomCryptoCell, [CryptoCoin]>!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.frame = view.bounds
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCryptoCell.self,
                           forCellReuseIdentifier: CustomCryptoCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello, User"
        view.addSubview(tableView)
        
        setupNavBar()
    }
    
    
    func callToViewModelForUIUpdate() {
        self.viewModels = viewModels()
        self.viewModels.bind
    }
    
    
    func setupNavBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Привет, \(String(describing: StorageManager.shared.fetchAccount()))"
        
        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.backgroundColor = UIColor(named: "MilkyWay")
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                            target: self,
                                                            action: #selector(logOut))
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    @objc func logOut() {
        self.view.window!.rootViewController = LoginViewController()
    }
    
    deinit {
        print("Table view has been dealocated")
    }

}




//MARK: - EXTENSION FOR VIEW CONTROLLER

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCryptoCell.identifier,
                                                       for: indexPath) as? CustomCryptoCell else {
                                                       return UITableViewCell() }
        cell.configure(with: viewModels[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


//        NetworkManager.shared.getAllCryptoData { [weak self] result in
//            switch result {
//            case .success(let models):
//                self?.viewModels = models.compactMap({ CryptoTableViewCellViewModel(name: $0.name,
//                                                                                    symbol: $0.symbol,
//                                                                                    price: String($0.currentPrice),
//                                                                                    image: $0.image)
//                })
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            case .failure(let error):
//                print("Error \(error)")
//            }
//        }
