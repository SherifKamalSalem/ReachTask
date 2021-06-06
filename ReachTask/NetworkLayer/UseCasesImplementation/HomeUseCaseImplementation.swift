//
//  HomeUseCaseImplementation.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation
import RxSwift

final class HomeUseCaseImplementation: HomeUseCase {
    private let network: HomeNetwork

    init(network: HomeNetwork) {
        self.network = network
    }
    
    func getCategories() -> Observable<Categories> {
        let categories = network.fetchHome().flatMap { categories -> Observable<Categories> in
            return Observable.of(categories.toDomain())
        }
        return categories
    }
}
