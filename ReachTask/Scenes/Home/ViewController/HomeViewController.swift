//
//  HomeViewController.swift
//  ReachTask
//
//  Created by sherif kamal on 07/06/2021.
//

import UIKit
import RxSwift
import RxCocoa
import SkeletonView
import RxDataSources

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UIStackView!
    @IBOutlet private weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }
    
    private func setupView() {
        tableView.register(nibWithCellClass: CategoryCell.self)
        tableView.register(nib: CategorySectionHeaderView.nib, withHeaderFooterViewClass: CategorySectionHeaderView.self)
        tableView.dataSource = nil
        tableView.delegate = nil
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
    }
    
    private func bindViewModel() {
        assert(viewModel != nil)
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = HomeViewModel.Input(trigger: Driver.merge(viewWillAppear))
        let output = viewModel.transform(input: input)
        output.categories
            .debug()
            .drive(onNext: { [weak self] categories in
                self?.populateAllCategoriesTableView(with: categories)
            })
            .disposed(by: disposeBag)
        
        output.fetching
            .drive(onNext: { [weak self] isFetching in
                switch isFetching {
                case true:
                    self?.view.showAnimatedGradientSkeleton()
                case false:
                    self?.view.hideSkeleton()
                }
            })
            .disposed(by: disposeBag)
    }
    
}
