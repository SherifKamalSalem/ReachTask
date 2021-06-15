//
//  UseCaseProviderImplementation.swift
//  ReachTask
//
//  Created by sherif kamal on 08/06/2021.
//

import Foundation

public final class UseCaseProviderImplementation: UseCaseProvider {
    
    private let networkProvider: NetworkProvider

    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeHomeUseCase() -> HomeUseCase {
        return HomeUseCaseImplementation(network: networkProvider.makeHomeNetwork())
    }

}
