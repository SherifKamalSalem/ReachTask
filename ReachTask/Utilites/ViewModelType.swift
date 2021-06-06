//
//  ViewModelType.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
