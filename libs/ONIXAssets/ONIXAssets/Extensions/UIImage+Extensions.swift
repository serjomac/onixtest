//
//  UIImage+Extensions.swift
//  ONIXAssets
//
//  Created by Jonathan Macías on 29/10/22.
//

import UIKit

extension UIImage {
    static func imageFromLocalBundle(named name: String) -> UIImage {
        guard let image = UIImage(named: name, in: .ONIXAssetsBundle(), compatibleWith: nil) else {
            fatalError("Image \(name) not found")
        }
        return image
    }
}

extension UIColor {
    static func colorFromLocalBundle(named name: String) -> UIColor {
        guard let color = UIColor(named: name, in: .ONIXAssetsBundle(), compatibleWith: nil) else {
            fatalError("Color \(name) not found")
        }
        return color
    }
}
