//
//  SimpleCollectionViewCell.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 21.07.21.
//

import UIKit

class SimpleCollectionViewCell: UICollectionViewCell {

    var image: UIImage? {
        didSet {
            self.imageView.image = self.image
        }
    }

    var title: String = "" {
        didSet {
            self.titleLabel.text = title
        }
    }

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        self.imageView.image = nil
        self.titleLabel.text = nil
    }
}
