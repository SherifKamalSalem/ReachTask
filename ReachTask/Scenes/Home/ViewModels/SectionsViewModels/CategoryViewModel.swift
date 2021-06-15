//
//  CategoryViewModel.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation

final class CategoryViewModel {
    let id: Int
    let slug: String
    let usersViewModels: [UserViewModel]
    
    init(with category: Category) {
        self.id = category.id
        self.slug = category.slug
        self.usersViewModels = category.users.data.compactMap { UserViewModel(with: $0) }
    }
}
