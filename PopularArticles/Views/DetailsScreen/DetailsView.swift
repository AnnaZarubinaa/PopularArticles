//
//  DetailsView.swift
//  PopularArticles
//
//  Created by Hanna on 16.02.2023.
//

import UIKit

final class DetailsView: UIView {

    // MARK: - UI
    
    private var titleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.numberOfLineTitle
        label.font = UIFont.boldSystemFont(ofSize: Constants.fontSizeTitle)
        return label
    }()
    
    private var authorLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.fontSizeAuthor)
        label.textColor = UIColor.systemGray
        return label
    }()
    
    private var sourceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Constants.fontSizeSource)
        return label
    }()
    
    private var shortPlotLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.numberOfLinePlot
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

extension DetailsView {
    
    func configure(with article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author
        sourceLabel.text = "\(article.source), \(article.publishedDate)"
        shortPlotLabel.text = article.shortPlot
    }
    
}

// MARK: - Private functions

private extension DetailsView {
    
    func layoutSubview() {
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(sourceLabel)
        addSubview(shortPlotLabel)
        
    }
    
    func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        shortPlotLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: Constants.spacing).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.inset).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.inset).isActive = true
        
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.spacing).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.inset).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.inset).isActive = true
        
        sourceLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: Constants.spacing).isActive = true
        sourceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.inset).isActive = true
        sourceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.inset).isActive = true
        
        shortPlotLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: Constants.spacing).isActive = true
        shortPlotLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.inset).isActive = true
        shortPlotLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.inset).isActive = true
    }
    
}

// MARK: - Constants

private extension DetailsView {
    
    enum Constants {
        static let inset: CGFloat = 20
        static let spacing: CGFloat = 10
        static let numberOfLineTitle: Int = 2
        static let numberOfLinePlot: Int = 10
        static let fontSizeTitle: CGFloat = 23
        static let fontSizeAuthor: CGFloat = 15
        static let fontSizeSource: CGFloat = 17
    }
    
}
