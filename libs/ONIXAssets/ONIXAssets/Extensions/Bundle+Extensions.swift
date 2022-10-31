//
//  Bundle+Extensions.swift
//  ONIXAssets
//
//  Created by Jonathan Macías on 29/10/22.
//

import Foundation
class ONIXBundle {}

extension Bundle {
    static func ONIXAssetsBundle() -> Bundle {
        Bundle(for: ONIXBundle.self)
    }
}
