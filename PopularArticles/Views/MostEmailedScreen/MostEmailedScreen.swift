//
//  MostEmailedScreen.swift
//  PopularArticles
//
//  Created by Hanna on 13.02.2023.
//

import UIKit

protocol MostEmailedScreenProtocol: AnyObject {
    func reloadData()
    func showAlert(with title: String, message: String)
}

class MostEmailedScreen: UITableViewController {
    
    // MARK: - Variables
    
    var presenter: MostEmailedPresenterProtocol!
    
    // MARK: - Override
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: - Private
    
    private func setupTableView() {
        tableView.register(CellView.self, forCellReuseIdentifier: Constants.cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - MostEmailedScreenProtocol

extension MostEmailedScreen: MostEmailedScreenProtocol {
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
    }
    
}

// MARK: - Table view data source

extension MostEmailedScreen {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowsCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! CellView
        
        cell.configure(with: presenter.getCellModel(by: indexPath.row))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsScreen = DetailsScreen()
        detailsScreen.configure(with: presenter.getCellModel(by: indexPath.row))
        navigationController?.pushViewController(detailsScreen, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.rowHeight
    }
    
}

// MARK: - Constants

private extension MostEmailedScreen {
    
    enum Constants {
        static let rowHeight: CGFloat = 200
        static let cellReuseIdentifier: String = "cell"
    }
    
}
