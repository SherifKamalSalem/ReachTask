//
//  OffersCell.swift
//  ReachTask
//
//  Created by sherif kamal on 11/06/2021.
//

import UIKit
import RxSwift

class OffersCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    static var reuseID = "OffersCell"
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 150)
        collectionView!.collectionViewLayout = layout
        collectionView.register(nibWithCellClass: OfferCollectionViewCell.self)
        collectionView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    func configure(with offers: OffersViewModel) {
        self.collectionView.delegate = nil
        self.collectionView.dataSource = nil
        populateAllOffersCollectionView(with: offers)
    }
}

extension OffersCell {
    private func populateAllOffersCollectionView(with offers: OffersViewModel) {
        Observable.just(offers.offers)
            .debug()
            .bind(to: self.collectionView.rx.items(cellIdentifier: OfferCollectionViewCell.reuseID, cellType: OfferCollectionViewCell.self)) { (row, element, cell) in
                cell.configure(with: element)
        }
        .disposed(by: self.disposeBag)
    }
}

extension OffersCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        let width = collectionSize.width * 0.85
        return CGSize(width: width, height: collectionSize.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
