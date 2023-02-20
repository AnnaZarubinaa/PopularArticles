//
//  TabBarController.swift
//  PopularArticles
//
//  Created by Hanna on 13.02.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    private func setupVCs() {
        viewControllers = [
            createNavigationController(for: createMostEmailedScreen(), screenType: .mostShared),
            createNavigationController(for: createMostViewedScreen(), screenType: .mostViewed),
            createNavigationController(for: createMostSharedScreen(), screenType: .mostShared)
        ]
    }

    private func createNavigationController(for rootViewController: UIViewController, screenType: ScreenType) -> UIViewController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.title = screenType.screenTitle()
        navigationController.tabBarItem.image = screenType.barIcon()
        rootViewController.navigationItem.title = screenType.screenTitle()
        
        return navigationController
    }
    
    private func createMostEmailedScreen() -> UIViewController {
        let view = MostEmailedScreen()
        let presenter = MostEmailedPresenter(view: view, screenType: .mostEmailed)
        view.presenter = presenter
        
        return view
    }
    
    private func createMostViewedScreen() -> UIViewController {
        let view = MostEmailedScreen()
        let presenter = MostEmailedPresenter(view: view, screenType: .mostViewed)
        view.presenter = presenter
        
        return view
    }
    
    private func createMostSharedScreen() -> UIViewController {
        let view = MostEmailedScreen()
        let presenter = MostEmailedPresenter(view: view, screenType: .mostShared)
        view.presenter = presenter
        
        return view
    }

}
