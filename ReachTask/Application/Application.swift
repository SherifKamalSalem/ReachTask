//
//  Application.swift
//  ReachTask
//
//  Created by sherif kamal on 08/06/2021.
//

import Foundation
import UIKit

final class Application {
    static let shared = Application()

    private let networkUseCaseProvider: UseCaseProvider
    private let offersNetworkUseCaseProvider: OffersUseCaseProvider

    private init() {
        self.networkUseCaseProvider = UseCaseProviderImplementation()
        self.offersNetworkUseCaseProvider = OffersUseCaseProviderImplementation()
    }

    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.tabBarItem = UITabBarItem(title: "Home",
                image: UIImage(named: "home"),
                selectedImage: nil)
        let networkNavigator = DefaultHomeNavigator(
            services: networkUseCaseProvider,
            offersServices: offersNetworkUseCaseProvider,
            navigationController: navigationController,
            storyBoard: storyboard
        )

        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor(red: 0.00, green: 0.80, blue: 0.49, alpha: 1.00)
        tabBarController.viewControllers = [
            navigationController
        ]
        window.rootViewController = tabBarController

        networkNavigator.toHome()
    }
}
