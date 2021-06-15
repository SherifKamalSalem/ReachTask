//
//  OffersViewModel.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation

final class OffersViewModel {
    var offers = [OfferViewModel]()
    
    init(with offers: [Offer]) {
        self.offers = offers.compactMap({ OfferViewModel(with: $0) })
    }
}

final class OfferViewModel {
    let id: Int
    let title: String?
    var bannerImage: URL? = nil
    
    init(with offer: Offer) {
        self.id = offer.id
        self.title = offer.title
        if let bannerImage = URL(string: offer.bannerImage ?? "") {
            self.bannerImage = bannerImage
        }
    }
}

