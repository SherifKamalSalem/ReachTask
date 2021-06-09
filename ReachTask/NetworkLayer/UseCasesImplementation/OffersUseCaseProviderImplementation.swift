//
//  OffersUseCaseProviderImplementation.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation

public final class OffersUseCaseProviderImplementation: OffersUseCaseProvider {
    
    private let networkProvider: NetworkProvider

    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeOffersUseCase() -> OffersUseCase {
        return OffersUseCaseImplementation(network: networkProvider.makeOffersNetwork())
    }
}
