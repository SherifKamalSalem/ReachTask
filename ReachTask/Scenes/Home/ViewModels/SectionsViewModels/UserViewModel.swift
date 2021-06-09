//
//  UserViewModel.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation

final class UserViewModel {
    let name: String
    var profilePicture: URL? = nil
    var coverPhoto: URL? = nil
    
    init(with user: UsersInfo) {
        self.name = user.name
        if let pic = user.profilePicture, let profilePicture = URL(string: pic) {
            self.profilePicture = profilePicture
        }
        if let pic = user.coverPhoto, let coverPhoto = URL(string: pic) {
            self.coverPhoto = coverPhoto
        }
    }
}
