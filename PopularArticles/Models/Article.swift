//
//  Article.swift
//  PopularArticles
//
//  Created by Hanna on 13.02.2023.
//

struct Articles: Decodable {
    
    var count: Int
    var all: [Article]
    
    enum CodingKeys: String, CodingKey {
        case count = "num_results"
        case all = "results"
    }
    
}

struct Article: Decodable {
    
    var source: String
    var publishedDate: String
    var author: String
    var title: String
    var shortPlot: String

    enum CodingKeys: String, CodingKey {
        case source
        case publishedDate = "published_date"
        case author = "byline"
        case title
        case shortPlot = "abstract"
    }

}
