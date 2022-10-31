//
//  PostsPresenter.swift
//  ONIXPosts
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import ONIXEntites

protocol PostPresenterProtocol {
    func fetchPosts(page: Int) -> Void
    func viewDidLoad()
    func getPostByIndex(index: Int) -> Post?
    var postCount: Int { get }
}

class PostsPresenter {
    
    // MARK: - PROPIEDADES
    unowned var view: PostsViewProtocol
    var interactor: PostsInteractorProtocol
    var router: PostsRouterProtocol
    var posts: [Post] = []
    
    init(view: PostsViewProtocol, interactor: PostsInteractorProtocol, router: PostsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension PostsPresenter: PostPresenterProtocol {
    var postCount: Int {
        return posts.count
    }
    
    
    func getPostByIndex(index: Int) -> Post? {
        return self.posts[index]
    }
    
    func viewDidLoad() {
        fetchPosts(page: 100)
    }
    
    func fetchPosts(page: Int) {
        interactor.fetchPosts(page: page) { result in
            switch result {
            case .success(let response):
                if let data = response.data, let posts = data.posts, !posts.isEmpty {
                    self.view.postsRetrivel(posts: posts)
                }
            case .failure(let error):
                break
            }
        }
    }
    
    
}
