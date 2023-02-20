//
//  ArticleView.swift
//  PopularArticles
//
//  Created by Hanna on 15.02.2023.
//

import UIKit

final class ArticleView: UIView {
    
    // MARK: - UI
    
    private var titleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var authorLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.systemGray
        return label
    }()
    
    private var shortPlotLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSubview()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configuration

extension ArticleView {
    
    func configure(with article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author
        shortPlotLabel.text = article.shortPlot
    }
    
}

// MARK: - Private functions

private extension ArticleView {
    
    func layoutSubview() {
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(shortPlotLabel)
        
    }
    
    func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        shortPlotLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: Constants.spacing).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.inset).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.inset).isActive = true
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.spacing).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.inset).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.inset).isActive = true
        shortPlotLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: Constants.spacing).isActive = true
        shortPlotLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.inset).isActive = true
        shortPlotLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.inset).isActive = true
    }
    
}

// MARK: - Constants

private extension ArticleView {
    
    enum Constants {
        static let inset: CGFloat = 20
        static let spacing: CGFloat = 10
    }
    
}
