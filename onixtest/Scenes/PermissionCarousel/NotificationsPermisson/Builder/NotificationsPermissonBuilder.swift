//
//  NotificationsPermissonBuilder.swift
//  onixtest
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import UIKit

struct NotificationsPermissonBuilder {
    static func build() -> NotificationsPermissonViewController {
        let mainStoryboard = UIStoryboard(name: "NotificationsPermisson", bundle: nil)
        let viewController: NotificationsPermissonViewController = mainStoryboard.instantiateViewController(withIdentifier: "NotificationsPermissonViewController") as! NotificationsPermissonViewController
        let viewModel: NotificationsPermissonViewModel = .init()
        //let viewController: NotificationsPermissonViewController = .init()
        viewController.viewModel = viewModel
        return viewController
    }
}
