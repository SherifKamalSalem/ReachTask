//
//  User.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation

// MARK: - Users
public struct Users {
    let data: [UsersInfo]
}


// MARK: - UsersInfo
public struct UsersInfo: Codable {
    let object: String?
    let id: Int?
    let username: String?
    let name: String
    let bio: String?
    let profilePicture: String?
    let coverPhoto: String?
    let backgroundImage, phoneBackground: String?
}
