//
//  NetworkDataManager.swift
//  PopularArticles
//
//  Created by Hanna on 14.02.2023.
//

import Alamofire

class NetworkDataManager {
    
    static let shared = NetworkDataManager()
    
    private init() {}
    
    func fetchData(screenType: ScreenType, completion: @escaping (Result<Articles, Error>) -> Void) {
        
        var url = ""
        switch screenType {
        case .mostEmailed:
            url = APIConstants.mostEmailedUrl
        case .mostShared:
            url = APIConstants.mostSharedUrl
        case .mostViewed:
            url = APIConstants.mostViewedUrl
        }
        
        AF.request(url)
            .validate()
            .responseDecodable(of: Articles.self) { (response) in
                switch response.result {
                case .success(let articles):
                    completion(.success(articles))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
