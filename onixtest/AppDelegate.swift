//
//  AppDelegate.swift
//  onixtest
//
//  Created by Jonathan Macías on 28/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainStoryboard = UIStoryboard(name: "CameraPermisson", bundle: nil)
        let viewModel: CameraPermissonViewModel = .init()
        let viewController: CameraPermissonViewController = mainStoryboard.instantiateViewController(withIdentifier: "CameraPermissonViewController") as! CameraPermissonViewController
        viewController.viewModel = viewModel
        let root: UINavigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = root
        self.window?.makeKeyAndVisible()
        return true
    }

}

