//
//  Offers.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation

// MARK: - Offers
struct Offers {
    let data: OffersInfo?
}

// MARK: - DataClass
struct OffersInfo {
    let offers: OffersData?
}

// MARK: - Games
struct OffersData {
    let data: [Offer]?
}

// MARK: - Datum
struct Offer {
    let id: Int
    let title: String?
    let coverImage, bannerImage: String?
    let cta: String?
    let ctaURL: String?
    let ctaTextColor, ctaBackgroundColor, dueDate: String?
    let user: Users?
    let categories: [Category]?
}
