//
//  ArticleItem+CoreDataProperties.swift
//  
//
//  Created by Hanna on 16.02.2023.
//
//

import Foundation
import CoreData


public class ArticleItem: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleItem> {
        return NSFetchRequest<ArticleItem>(entityName: "ArticleItem")
    }

    @NSManaged public var itemAuthor: String?
    @NSManaged public var itemPublishedDate: String?
    @NSManaged public var itemShortPlot: String?
    @NSManaged public var itemSource: String?
    @NSManaged public var itemTitle: String?

}
