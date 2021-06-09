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
    private let offersUseCase: OffersUseCase
    private let navigator: HomeNavigator
    
    init(useCase: HomeUseCase, offersUseCase: OffersUseCase, navigator: HomeNavigator) {
        self.useCase = useCase
        self.offersUseCase = offersUseCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let categories = input.trigger.flatMapLatest {
            return self.useCase.getCategories()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
                .map { $0.data.map { CategoryViewModel(with: $0) } }
        }
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        
        return Output(fetching: fetching,
                      categories: categories,
                      error: errors)
    }
}
