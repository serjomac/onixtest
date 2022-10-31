//
//  LocationPermissonBuilder.swift
//  onixtest
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import UIKit

struct LocationPermissonBuilder {
    static func build() -> LocationPermissonViewController {
        let viewModel: LocationPermissonViewModel = .init()
        let mainStoryboard = UIStoryboard(name: "LocationPermisson", bundle: nil)
        let viewController: LocationPermissonViewController = mainStoryboard.instantiateViewController(withIdentifier: "LocationPermissonViewController") as! LocationPermissonViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
