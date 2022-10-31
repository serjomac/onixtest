//
//  Struct.swift
//  onixtest
//
//  Created by Jonathan Macías on 29/10/22.
//

import Foundation

struct CameraPermissonBuilder {
    static func build() -> CameraPermissonViewController {
        let viewModel: CameraPermissonViewModel = .init()
        let viewController: CameraPermissonViewController = .init()
        viewController.viewModel = viewModel
        return viewController
    }
}
