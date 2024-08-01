//
//  HomeViewModel.swift
//  iOSTemplate
//
//  Created by Phillip MacBook Pro on 31/07/24.
//

import Foundation
import RxCocoa
import RxSwift

public class HomeViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let data: Driver<[HomeResponse]>
    }

    func transform(input: Input) -> Output {
        let response = input.loadTrigger.flatMap { _ -> Driver<[HomeResponse]> in
            return HomeNetworkProvider.shared.getRandomFood().map {
                $0.categories
            }.asDriver(onErrorJustReturn: [])
        }
    
        return Output(
            data: response
        )
    }
}
