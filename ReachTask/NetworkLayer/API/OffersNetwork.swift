//
//  OffersNetwork.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation
import RxSwift

public final class OffersNetwork {
    private let network: Network<APIOffers>

    init(network: Network<APIOffers>) {
        self.network = network
    }

    public func fetchOffers() -> Observable<APIOffers> {
        return network.request("timeline")
    }
}
