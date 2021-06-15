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
