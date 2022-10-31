//
//  PostsRouter.swift
//  ONIXPosts
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation

protocol PostsRouterProtocol {
    
}

class PostsRouter: PostsRouterProtocol {
    private unowned let viewController: PostsViewProtocol
    
    init(viewController: PostsViewProtocol) {
        self.viewController = viewController
    }
}
