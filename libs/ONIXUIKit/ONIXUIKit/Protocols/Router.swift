//
//  Router.swift
//  ONIXUIKit
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import UIKit

public protocol Router {
    associatedtype Route
    associatedtype ViewModel
    func route(route: Route, context: UIViewController)
    var viewModel: ViewModel { get set }
}
