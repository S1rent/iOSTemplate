//
//  FoodNetworkProvider.swift
//  iOSTemplate
//
//  Created by Phillip MacBook Pro on 31/07/24.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

class HomeNetworkProvider {
    private let provider = MoyaProvider<HomeTarget>()
    public static let shared = HomeNetworkProvider()
    
    private init() {}
    
    public func getRandomFood() -> Observable<HomeResponseWrapper> {
        let requestToken = HomeTarget.getCategories
        
        return self.provider.rx
            .request(requestToken)
            .filterSuccessfulStatusCodes()
            .map(HomeResponseWrapper.self)
            .map { $0 }
            .asObservable()
    }
}
