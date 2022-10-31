//
//  CameraPermissonRouter.swift
//  onixtest
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import ONIXUIKit
import UIKit

struct CameraPermissonRouter: Router {
    enum Route {
        case notificationsPermisson
    }
    unowned var viewModel: CameraPermissonViewModel
    
    init(viewModel: CameraPermissonViewModel) {
        self.viewModel = viewModel
    }
    
    func route(route: CameraPermissonRouter.Route, context: UIViewController) {
        switch route {
        case .notificationsPermisson:
            let viewController: NotificationsPermissonViewController = NotificationsPermissonBuilder.build()
            context.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}
