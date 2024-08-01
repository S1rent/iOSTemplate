//
//  HomeViewController.swift
//  iOSTemplate
//
//  Created by Phillip MacBook Pro on 31/07/24.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel: HomeViewModel
    private let loadTrigger: BehaviorRelay<Void>
    private let disposeBag: DisposeBag
    private let navigator: HomeNavigator
    
    init(viewModel: HomeViewModel, navigator: HomeNavigator) {
        self.viewModel = viewModel
        self.loadTrigger = BehaviorRelay(value: ())
        self.disposeBag = DisposeBag()
        self.navigator = navigator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.bindUI()
    }
    
    func bindUI() {
        let output = self.viewModel.transform(input: HomeViewModel.Input(loadTrigger: loadTrigger.asDriver()))
        
        self.disposeBag.insert(
            output.data.drive(self.tableView.rx.items(cellIdentifier: HomeTableViewCell.identifier, cellType: HomeTableViewCell.self)) { (sequence, data, cell) in
                
                cell.setData(food: data)
            }
        )
    }

    private func setupTableView() {
        self.tableView.register(UINib(nibName: HomeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
        self.tableView.rowHeight =  UITableView.automaticDimension
        self.tableView.rx.modelSelected(Any.self)
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            
            if let foodData = data as? HomeResponse {
                self.navigator.goToDetail(foodData)
            }
            
            self.deselectRow()
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        .disposed(by: self.disposeBag)
    }
    
    private func deselectRow() {
       if let index = self.tableView.indexPathForSelectedRow {
           self.tableView.deselectRow(at: index, animated: true)
       }
   }
}
