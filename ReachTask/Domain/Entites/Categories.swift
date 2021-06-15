//
//  Entities.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation
// MARK: - JBETACostRequest
public struct Categories {
    let data: [Category]
    let meta: Meta
}

// MARK: - JBETACostRequestDatum
public struct Category {
    let id: Int
    let slug, name: String
    let users: Users
}

// MARK: - Meta
public struct Meta {
    let pagination: Pagination
}

// MARK: - Pagination
public struct Pagination {
    let total, count, perPage, currentPage: Int
    let totalPages: Int
    let links: String?
}
