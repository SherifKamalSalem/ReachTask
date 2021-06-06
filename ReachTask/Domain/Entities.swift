//
//  Entities.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation
// MARK: - JBETACostRequest
struct Categories {
    let data: [Category]
    let meta: Meta
}

// MARK: - JBETACostRequestDatum
struct Category {
    let id: Int
    let slug, name: String
    let users: Users
}

// MARK: - Users
struct Users {
    let data: [UsersInfo]
}

// MARK: - Meta
struct Meta {
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination {
    let total, count, perPage, currentPage: Int
    let totalPages: Int
    let links: String?
}
