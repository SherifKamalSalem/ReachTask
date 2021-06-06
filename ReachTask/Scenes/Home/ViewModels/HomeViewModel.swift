//
//  HomeViewModel.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation
import RxSwift
import RxCocoa


class HomeViewModel: ViewModelType {
    
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
        let fetching: Driver<Bool>
        let categories: Driver<[CategoryViewModel]>
        let error: Driver<Error>
    }
    
    private let useCase: HomeUseCase
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
}
