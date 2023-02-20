//
//  MostEmailedPresenter.swift
//  PopularArticles
//
//  Created by Hanna on 14.02.2023.
//

import UIKit

protocol MostEmailedPresenterProtocol: AnyObject {
    func viewWillAppear()
    func getRowsCount() -> Int
    func getCellModel(by row: Int) -> Article
}

final class MostEmailedPresenter {
    
    private weak var view: MostEmailedScreenProtocol?
    
    private var screenType: ScreenType
    private var articles = [Article]()
    private let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
    
    init(view: MostEmailedScreenProtocol, screenType: ScreenType) {
        self.view = view
        self.screenType = screenType
    }
    
}

// MARK: - MostEmailedPresenterProtocol

extension MostEmailedPresenter: MostEmailedPresenterProtocol {
    
    func viewWillAppear() {
        fetchArticles()
    }
    
    func getRowsCount() -> Int {
        return self.articles.count
    }
    
    func getCellModel(by row: Int) -> Article {
        return articles[row]
    }
}

// MARK: - Private

private extension MostEmailedPresenter {
    
    private func fetchArticles() {
        
        if articles.isEmpty {
            NetworkDataManager.shared.fetchData(screenType: self.screenType) { result in
                switch result {
                case .success(let articles):
                    self.articles = articles.all
                    self.saveToContext(articles: articles.all)
                    self.view?.reloadData()
                case .failure(_):
                    self.view?.showAlert(with: Constants.errorTitle, message: Constants.errorFetchData)
                }
            }
        }
        
    }
    
    private func fetchFromContext() {
        do {
            let articleFromContext = try managedContext.fetch(ArticleItem.fetchRequest())
            self.articles = []

            for article in articleFromContext {
                if let title = article.itemTitle,
                   let source = article.itemSource,
                   let date = article.itemPublishedDate,
                   let author = article.itemAuthor,
                   let plot = article.itemShortPlot {
                    let newArticle = Article(
                        source: source,
                        publishedDate: date,
                        author: author,
                        title: title,
                        shortPlot: plot
                    )
                    self.articles.append(newArticle)
                }
            }
            self.view?.reloadData()
            
        } catch {
            print(Constants.errorFetchData)
        }
    }
    
    private func saveToContext(articles: [Article]) {
        
        for article in articles {
            let newArticle = ArticleItem(context: managedContext)
            newArticle.itemTitle = article.title
            newArticle.itemAuthor = article.author
            newArticle.itemShortPlot = article.shortPlot
            newArticle.itemPublishedDate = article.publishedDate
            newArticle.itemSource = article.source
            
            do {
                try self.managedContext.save()
            }
            catch {
                print(Constants.errorSaveMessage)
            }
        }
        
    }
    
}

// MARK: - Constants

private extension MostEmailedPresenter {
    
    enum Constants {
        static let errorFetchData: String = "Could not get data, error:"
        static let errorTitle: String = "Warning"
        static let errorSaveMessage: String = "Could not save to context"
    }
    
}

