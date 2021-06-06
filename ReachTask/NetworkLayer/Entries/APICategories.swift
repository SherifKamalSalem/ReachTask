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

// MARK: - JBETACostRequestDatum
public struct APICategory: Decodable {
    let id: Int
    let slug, name: String
    let users: APIUsers
}

// MARK: - Meta
public struct APIMeta: Decodable {
    let pagination: APIPagination
}

// MARK: - Pagination
public struct APIPagination: Decodable {
    let total, count, perPage, currentPage: Int
    let totalPages: Int
    let links: String?
}
