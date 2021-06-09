//
//  OffersUseCase.swift
//  ReachTask
//
//  Created by sherif kamal on 09/06/2021.
//

import Foundation
import RxSwift

public protocol OffersUseCase {
    func getOffers() -> Observable<Offers>
}
