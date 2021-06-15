//
//  OfferCollectionViewCell.swift
//  ReachTask
//
//  Created by sherif kamal on 10/06/2021.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var offerBannerImageView: UIImageView!
    
    static let reuseID = "OfferCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        offerBannerImageView.layer.cornerRadius = 8
    }

    func configure(with viewModel: OfferViewModel) {
        offerBannerImageView.kf.setImage(with: viewModel.bannerImage, placeholder: UIImage(systemName: "photo.fill"))
    }
}
