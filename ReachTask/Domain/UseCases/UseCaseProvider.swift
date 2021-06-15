//
//  UseCaseProvider.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation

public protocol UseCaseProvider {
    func makeHomeUseCase() -> HomeUseCase
}
