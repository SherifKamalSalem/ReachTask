//
//  APIOffers.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation

// MARK: - Offers
struct APIOffers {
    let data: APIOffersInfo?
}

extension APIOffers {
    func toDomain() -> APIOffers {
        return .init(data: data?.toDomain())
    }
}


// MARK: - DataClass
struct APIOffersInfo {
    let offers: APIOffersData?
}

extension APIOffersInfo {
    func toDomain() -> APIOffersInfo {
        return .init(offers: offers?.toDomain())
    }
}

// MARK: - Games
struct APIOffersData {
    let data: [APIOffer]?
}

extension APIOffersData {
    func toDomain() -> APIOffersData {
        return .init(data: data?.compactMap({ $0.toDomain() }))
    }
}

// MARK: - Datum
struct APIOffer {
    let id: Int
    let title: String?
    let coverImage, bannerImage: String?
    let cta: String?
    let ctaURL: String?
    let ctaTextColor, ctaBackgroundColor, dueDate: String?
    let user: APIUsers?
    let categories: [APICategory]?
}

extension APIOffer {
    func toDomain() -> APIOffer {
        return .init(id: id, title: title, coverImage: coverImage, bannerImage: bannerImage, cta: cta, ctaURL: ctaURL, ctaTextColor: ctaTextColor, ctaBackgroundColor: ctaBackgroundColor, dueDate: dueDate, user: user, categories: categories)
    }
}
