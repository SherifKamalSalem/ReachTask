//
//  OffersUseCaseProvider.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation

public protocol OffersUseCaseProvider {
    func makeOffersUseCase() -> OffersUseCase
}
