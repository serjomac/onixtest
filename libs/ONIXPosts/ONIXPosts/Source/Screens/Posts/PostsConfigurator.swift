//
//  PostsConfigurator.swift
//  ONIXPosts
//
//  Created by Jonathan Macías on 30/10/22.
//
import UIKit

public class PostsConfigurator {
    static let shared = PostsConfigurator()
    
    func configurator(with viewController: PostsViewController) {
        let interactor = PostsInteractor()
        let router = PostsRouter(viewController: viewController)
        let presenter = PostsPresenter(view: viewController, interactor: interactor, router: router)
        viewController.presenter = presenter
    }
    
    static public func viewControllerInstance() -> PostsViewController? {
        let bundle = Bundle(identifier: "jonathan.ONIXPosts")
        let storyboard = UIStoryboard(name: "PostsView", bundle: bundle)
        let viewConroller = storyboard.instantiateViewController(withIdentifier: "PostsViewController") as? PostsViewController
        guard let viewConroller = viewConroller else {
            return nil
        }
        return viewConroller
    }
}
