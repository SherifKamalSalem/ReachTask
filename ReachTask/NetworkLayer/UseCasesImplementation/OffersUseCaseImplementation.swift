//
//  OffersUseCaseImplementation.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation
import RxSwift

final class OffersUseCaseImplementation: OffersUseCase {
    private let network: OffersNetwork

    init(network: OffersNetwork) {
        self.network = network
    }
    
    func getOffers() -> Observable<Offers> {
        let offers = network.fetchOffers().flatMap { offers -> Observable<Offers> in
            return Observable.of(offers.toDomain())
        }
        return offers
    }
}
