//
//  HomeManager.swift
//  iOSTemplate
//
//  Created by Phillip MacBook Pro on 31/07/24.
//

import Foundation
import UIKit

protocol ViewService {
    func loadViewController() -> UIViewController
}

public class HomeService: ViewService {
    let viewController: HomeViewController
    
    init(viewModel: HomeViewModel, navigator: HomeNavigator) {
        self.viewController = HomeViewController(viewModel: viewModel, navigator: navigator)
    }
    
    func loadViewController() -> UIViewController {
        return viewController
    }
}

public class HomeManager {
    private let homeService: HomeService
    
    init(homeService: HomeService) {
        self.homeService = homeService
    }
    
    func loadViewController() -> UIViewController {
        return self.homeService.loadViewController()
    }
}
