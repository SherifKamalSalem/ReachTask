//
//  APICategories.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation


public struct APICategories: Decodable {
    let data: [APICategory]
    let meta: APIMeta
}

extension APICategories {
    func toDomain() -> Categories {
        return .init(data: data.map { Category(id: $0.id, slug: $0.slug,
                                               name: $0.name,
                                               users: $0.users.toDomain()) },
                     meta: meta.toDomain())
    }
}

// MARK: - JBETACostRequestDatum
public struct APICategory: Decodable {
    let id: Int
    let slug, name: String
    let users: APIUsers
}

extension APICategory {
    func toDomain() -> Category {
        .init(id: id, slug: slug, name: name, users: users.toDomain())
    }
}

// MARK: - Meta
public struct APIMeta: Decodable {
    let pagination: APIPagination
}

extension APIMeta {
    func toDomain() -> Meta {
        .init(pagination: pagination.toDomain())
    }
}

// MARK: - Pagination
public struct APIPagination: Decodable {
    let total, count, perPage, currentPage: Int?
    let totalPages: Int?
    let links: String?
}

extension APIPagination {
    func toDomain() -> Pagination {
        .init(total: total, count: count,
              perPage: perPage, currentPage: currentPage,
              totalPages: totalPages, links: links)
    }
}
