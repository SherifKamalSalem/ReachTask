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
        tableView.register(nibWithCellClass: OffersCell.self)
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
            .drive(onNext: { [weak self] categories in
                self?.populateAllCategoriesTableView(with: categories)
            })
            .disposed(by: disposeBag)
        
        output.offers
            .debug()
            .drive(onNext: { [weak self] offers in
                guard let offers = offers else { return }
                self?.populateAllCategoriesTableView(or: offers)
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

extension HomeViewController {
    private func populateAllCategoriesTableView(with categories: [CategoryViewModel] = [], or offers: OffersViewModel? = nil) {
        tableView.dataSource = nil
        tableView.delegate = nil
        var sections = [MultipleSectionModel]()
        if let offers = offers {
            sections.append(.offersSection(title: "", items: offers))
        }
        sections.append(.categoriesSection(title: "", items: categories))
        let dataSource = RxTableViewSectionedReloadDataSource<MultipleSectionModel>(configureCell: { datasource, table, indexPath, item in
            switch datasource[indexPath] {
            case let .categories(item):
                let cell = table.dequeueReusableCell(withClass: CategoryCell.self)
                cell.configure(with: item, indexPath: indexPath)
                return cell
            case .offers(items: let items):
                let cell = table.dequeueReusableCell(withClass: OffersCell.self)
                cell.configure(with: items)
                return cell
            }
        })
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].title.capitalized
        }
        
        Observable.just(sections)
            .debug()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
}

