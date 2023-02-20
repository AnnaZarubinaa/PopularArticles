//
//  DetailsScreen.swift
//  PopularArticles
//
//  Created by Hanna on 14.02.2023.
//

import UIKit

final class DetailsScreen: UIViewController {
    
    // MARK: - UI
    
    private var detailView = DetailsView()
    
    // MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraints()
        navigationController?.navigationBar.tintColor = .black
    }
    
}

// MARK: - Setup

private extension DetailsScreen {
    
    func setupConstraints() {
        
        view.addSubview(detailView)

        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.topAnchor.constraint(equalTo: view.topAnchor , constant: Constants.topInset).isActive = true
        detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.inset).isActive = true
        detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.inset).isActive = true
    }
    
}

// MARK: - Configuration

extension DetailsScreen {
    
    func configure(with article: Article) {
        detailView.configure(with: article)
    }
    
}

// MARK: - Constants

private extension DetailsScreen {
    
    enum Constants {
        static let inset: CGFloat = 20
        static let spacing: CGFloat = 10
        static let topInset: CGFloat = 100
    }
    
}
