//
//  Offers.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation

// MARK: - Offers
public struct Offers {
    let data: OffersInfo?
}

// MARK: - DataClass
public struct OffersInfo {
    let offers: OffersData?
}

// MARK: - Games
public struct OffersData {
    let data: [Offer]?
}

// MARK: - Datum
public struct Offer {
    let id: Int
    let title: String?
    let coverImage, bannerImage: String?
    let cta: String?
    let ctaURL: String?
    let ctaTextColor, ctaBackgroundColor, dueDate: String?
    let user: Users?
    let categories: [Category]?
}
