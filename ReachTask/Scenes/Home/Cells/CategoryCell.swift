//
//  CategoryCell.swift
//  ReachTask
//
//  Created by sherif kamal on 07/06/2021.
//

import UIKit
import RxSwift

class CategoryCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var reuseID = "CategoryCell"
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private var viewModel: CategoryViewModel!
    
    private func setupView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 150)
        collectionView!.collectionViewLayout = layout
        collectionView.register(nibWithCellClass: ItemCell.self)
        collectionView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    func configure(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
        self.collectionView.delegate = nil
        self.collectionView.dataSource = nil
        populateAllUsersCollectionView(with: viewModel.usersViewModels)
    }
}

extension CategoryCell {
    private func populateAllUsersCollectionView(with users: [UserViewModel]) {
        Observable.just(users)
            .debug()
            .bind(to: self.collectionView.rx.items(cellIdentifier: ItemCell.reuseID, cellType: ItemCell.self)) { (row, element, cell) in
                cell.configure(viewModel: element)
        }
        .disposed(by: self.disposeBag)
    }
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        let width = collectionSize.width * 0.85
        return CGSize(width: width, height: collectionSize.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
