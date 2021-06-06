//
//  HomeUseCase.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation
import RxSwift

public protocol HomeUseCase {
    func getCategories() -> Observable<Categories>
}

