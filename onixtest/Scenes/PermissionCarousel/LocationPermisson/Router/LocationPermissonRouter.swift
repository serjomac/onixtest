//
//  LocationPermissonRouter.swift
//  onixtest
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import ONIXUIKit
import UIKit
import ONIXPosts

class LocationPermissonRouter: Router {
    enum Route {
        case posts
    }
    unowned var viewModel: LocationPermissonViewModel
    
    init(viewModel: LocationPermissonViewModel) {
        self.viewModel = viewModel
    }
    
    func route(route: LocationPermissonRouter.Route, context: UIViewController) {
        switch route {
        case .posts:
            let viewController = PostsConfigurator.viewControllerInstance()
            guard let viewController = viewController else {
                return
            }
            context.navigationController?.viewControllers = [viewController]
        }
    }
}
