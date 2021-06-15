//
//  HomeNetwork.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation
import RxSwift

public final class HomeNetwork {
    private let network: Network<APICategories>

    init(network: Network<APICategories>) {
        self.network = network
    }

    public func fetchHome() -> Observable<APICategories> {
        return network.request("categories")
    }
}
