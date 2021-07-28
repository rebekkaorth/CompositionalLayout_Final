//
//  UICollectionViewCell+Extension.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 21.07.21.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
