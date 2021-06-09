//
//  ItemCell.swift
//  ReachTask
//
//  Created by sherif kamal on 07/06/2021.
//

import UIKit
import Kingfisher

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var lbItemName: UILabel!
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    static let reuseID = "ItemCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.coverPhotoImageView.layer.cornerRadius = 8
        self.profileImageView.layer.cornerRadius = profileImageView.bounds.size.width / 2
    }
    
    func configure(viewModel: UserViewModel) {
        coverPhotoImageView.kf.setImage(with: viewModel.coverPhoto, placeholder: UIImage(systemName: "photo.fill"))
        profileImageView.kf.setImage(with: viewModel.profilePicture, placeholder: UIImage(systemName: "photo.fill"))
        lbItemName.text = viewModel.name
    }
}
