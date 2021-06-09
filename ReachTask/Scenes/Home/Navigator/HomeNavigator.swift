//
//  HomeNavigator.swift
//  ReachTask
//
//  Created by sherif kamal on 08/06/2021.
//

import Foundation
import UIKit

protocol HomeNavigator {
    func toHome()
}

class DefaultHomeNavigator: HomeNavigator {
    
    // MARK: - Properties
    
    private let storyBoard: UIStoryboard
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    private let offersServices: OffersUseCaseProvider

    // MARK: - Init
    
    init(services: UseCaseProvider,
         offersServices: OffersUseCaseProvider,
         navigationController: UINavigationController,
         storyBoard: UIStoryboard) {
        self.services = services
        self.offersServices = offersServices
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    
    // MARK: - HomeNavigator Functions
    
    func toHome() {
        guard let viewController = storyBoard.instantiateViewController(withClass: HomeViewController.self) else { return }
        viewController.viewModel = HomeViewModel(
            useCase: services.makeHomeUseCase(),
            offersUseCase: offersServices.makeOffersUseCase(),
            navigator: self
        )
        navigationController.pushViewController(viewController, animated: true)
    }

}
