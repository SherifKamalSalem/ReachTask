//
//  NetworkProvider.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation

final class NetworkProvider {
    private let apiEndpoint: String

    public init() {
        apiEndpoint = "https://api.dev.reachnetwork.co/api/v1/"
    }

    public func makeHomeNetwork() -> HomeNetwork {
        let network = Network<APICategories>(apiEndpoint)
        return HomeNetwork(network: network)
    }
}
