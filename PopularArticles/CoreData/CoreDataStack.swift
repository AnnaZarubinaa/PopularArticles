//
//  CoreDataStack.swift
//  PopularArticles
//
//  Created by Hanna on 16.02.2023.
//

import CoreData

class CoreDataStack {
    
    // MARK: - Variables
    
    private let modelName: String
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ArticleDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = self.persistentContainer.viewContext
    
    // MARK: - Initializers
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    // MARK: - Functions
    
    func saveContext() {
        if managedContext.hasChanges {
            do {
                try managedContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
