//
//  FixedSize.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 22.07.21.
//

import UIKit

protocol FixedSize: FixedHeight, FixedWidth {}

protocol FixedHeight {
    var height: CGFloat { get }
}

protocol FixedWidth {
    var width: CGFloat { get }
}
