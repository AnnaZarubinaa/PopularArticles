//
//  CellView.swift
//  PopularArticles
//
//  Created by Hanna on 14.02.2023.
//

import UIKit

final class CellView: UITableViewCell {
    
    // MARK: - UI
    
    private var articleView = ArticleView()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configure cell

extension CellView {
    
    func configure(with article: Article) {
        articleView.configure(with: article)
    }
    
}

// MARK: - Private

private extension CellView {
    
    func setupConstraints() {
        addSubview(articleView)
        
        articleView.translatesAutoresizingMaskIntoConstraints = false

        articleView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.inset).isActive = true
        articleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.inset).isActive = true
        articleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.inset).isActive = true
    }
    
}

// MARK: - Constants

private extension CellView {
    
    enum Constants {
        static let inset: CGFloat = 20
    }
    
}
