//
//  MultipleSectionModel.swift
//  ReachTask
//
//  Created by sherif kamal on 10/06/2021.
//

import Foundation
import RxDataSources
import RxCocoa

enum MultipleSectionModel {
    case categoriesSection(title: String, items: [CategoryViewModel])
    case offersSection(title: String, items: OffersViewModel)
}

enum SectionItem {
    case categories(item: CategoryViewModel)
    case offers(items: OffersViewModel)
}

extension MultipleSectionModel: SectionModelType {
    init(original: MultipleSectionModel, items: [SectionItem]) {
        switch original {
        case let .categoriesSection(title, items):
            self = .categoriesSection(title: title, items: items)
        case let .offersSection(title, items):
            self = .offersSection(title: title, items: items)
        }
    }
    
    typealias Item = SectionItem
    
    var items: [SectionItem] {
        switch  self {
        case .categoriesSection(title: _, items: let items):
            return items.map { .categories(item: $0) }
        case .offersSection(title: _, items: let items):
            return [items].map { .offers(items: $0) }
        }
    }
}

extension MultipleSectionModel {
    var title: String {
        switch self {
        case .categoriesSection(title: let title, items: _):
            return title
        case .offersSection(title: let title, items: _):
            return title
        }
    }
}
