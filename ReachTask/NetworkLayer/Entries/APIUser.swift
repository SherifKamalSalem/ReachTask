//
//  APIUser.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation
// MARK: - Users
public struct APIUsers: Decodable {
    let data: [APIUsersInfo]
}

extension APIUsers {
    func toDomain() -> Users {
        .init(data: data.map { $0.toDomain() } )
    }
}


// MARK: - UsersInfo
public struct APIUsersInfo: Decodable {
    let object: String
    let id: Int
    let username: String
    let name, bio: String?
    let profilePicture: String?
    let coverPhoto: String?
    let backgroundImage, phoneBackground: String?
}

extension APIUsersInfo {
    func toDomain() -> UsersInfo {
        .init(object: object, id: id, username: username,
              name: name ?? "", bio: bio, profilePicture: profilePicture,
              coverPhoto: coverPhoto, backgroundImage: backgroundImage,
              phoneBackground: phoneBackground)
    }
}

