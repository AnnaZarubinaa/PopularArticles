//
//  ScreenType.swift
//  PopularArticles
//
//  Created by Hanna on 15.02.2023.
//

import UIKit

enum ScreenType {
    
    case mostEmailed
    case mostShared
    case mostViewed
    
    func screenTitle() -> String {
        switch self {
        case .mostEmailed:
            return "Most emailed"
        case .mostShared:
            return "Most shared"
        case .mostViewed:
            return "Most viewed"
        }
    }
    
    func barIcon() -> UIImage {
        switch self {
        case .mostEmailed:
            return UIImage(systemName: "envelope")!
        case .mostShared:
            return UIImage(systemName: "square.and.arrow.up")!
        case .mostViewed:
            return UIImage(systemName: "eye")!
        }
    }
    
}

