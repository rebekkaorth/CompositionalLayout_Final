//
//  SectionHeadlineReusableView.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 22.07.21.
//

import UIKit

class SectionHeadlineReusableView: UICollectionReusableView {

    var headline: String = "headline placeholder" {
        didSet {
            self.headlineLabel.text = headline
        }
    }

    @IBOutlet private weak var headlineLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
