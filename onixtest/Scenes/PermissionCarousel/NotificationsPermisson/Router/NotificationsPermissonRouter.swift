//
//  NotificationsPermissonRouter.swift
//  onixtest
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import ONIXUIKit
import UIKit

class NotificationsPermissonRouter: Router {
    enum Route {
        case locationPermisson
    }
    unowned var viewModel: NotificationsPermissonViewModel
    
    init(viewModel: NotificationsPermissonViewModel) {
        self.viewModel = viewModel
    }
    
    func route(route: NotificationsPermissonRouter.Route, context: UIViewController) {
        switch route {
        case .locationPermisson:
            let viewController: LocationPermissonViewController = LocationPermissonBuilder.build()
            context.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
