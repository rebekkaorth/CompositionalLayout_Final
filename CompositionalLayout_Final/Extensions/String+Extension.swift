//
//  String+Extension.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 23.07.21.
//

import UIKit

// Kudos to: https://stackoverflow.com/questions/38809425/convert-apple-emoji-string-to-uiimage
extension String {
    func toImage() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
