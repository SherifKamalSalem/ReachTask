//
//  Network.swift
//  ReachTask
//
//  Created by sherif kamal on 06/06/2021.
//

import Foundation
import RxSwift
import RxAlamofire

final class Network<T: Decodable> {
    
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    private let decoder = JSONDecoder()
    
    init(_ endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func request(_ path: String) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)"
        return RxAlamofire
            .data(.get, absolutePath)
            .debug()
            .observe(on: scheduler)
            .map({ data -> T in
                self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try self.decoder.decode(T.self, from: data)
            })
    }
}
