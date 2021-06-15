//
//  APIOffers.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation

// MARK: - Offers
public struct APIOffers: Decodable {
    let data: APIOffersInfo?
}

extension APIOffers {
    func toDomain() -> Offers {
        return .init(data: data?.toDomain())
    }
}


// MARK: - DataClass
public struct APIOffersInfo: Decodable {
    let offers: APIOffersData?
}

extension APIOffersInfo {
    func toDomain() -> OffersInfo {
        return .init(offers: offers?.toDomain())
    }
}

// MARK: - Games
public struct APIOffersData: Decodable {
    let data: [APIOffer]?
}

extension APIOffersData {
    func toDomain() -> OffersData {
        return .init(data: data?.compactMap({ $0.toDomain() }))
    }
}

// MARK: - Datum
public struct APIOffer: Decodable {
    let id: Int
    let title: String?
    let coverImage, bannerImage: String?
    let ctaURL: String?
}

extension APIOffer {
    func toDomain() -> Offer {
        return .init(id: id, title: title, coverImage: coverImage, bannerImage: bannerImage, ctaURL: ctaURL)
    }
}
