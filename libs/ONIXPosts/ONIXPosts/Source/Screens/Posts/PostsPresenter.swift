//
//  PostsPresenter.swift
//  ONIXPosts
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import ONIXEntites

protocol PostPresenterProtocol {
    func fetchPosts(page: Int)
    func searchPosts(page: Int)
    func viewDidLoad()
    func getPostByIndex(index: Int) -> Post?
    var postCount: Int { get }
    func reloadPosts(page: Int)
}

class PostsPresenter {
    
    // MARK: - PROPIEDADES
    unowned var view: PostsViewProtocol
    var interactor: PostsInteractorProtocol
    var router: PostsRouterProtocol
    var posts: [Post] = []
    var postsFiltered: [Post] = []
    var isLoading = false
    public var previousRun = Date()
    public let minInterval = 0.9
    public var isFiltered = false
    public var query = ""
    
    init(view: PostsViewProtocol, interactor: PostsInteractorProtocol, router: PostsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension PostsPresenter: PostPresenterProtocol {
    var postCount: Int {
        if isFiltered {
            return postsFiltered.count
        } else {
            return posts.count
        }
    }
    
    
    func getPostByIndex(index: Int) -> Post? {
        if isFiltered {
            return self.postsFiltered[index]
        } else {
            return self.posts[index]
        }
    }
    
    func viewDidLoad() {
        reloadPosts(page: 5)
    }
    
    func reloadPosts(page: Int) {
        isLoading = true
        fetchPosts(page: page)
    }
    
    func fetchPosts(page: Int) {
        view.loaderPosts(show: isLoading)
        postsFiltered.removeAll()
        interactor.fetchPosts(page: page) { result in
            self.view.noSeachReultView(show: false)
            self.isLoading = false
            self.view.loaderPosts(show: self.isLoading)
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
    
    func searchPosts(page: Int) {
        isFiltered = true
        posts.removeAll()
        view.loaderPosts(show: isLoading)
        interactor.searchPosts(page: page, query: query) { result in
            self.isLoading = false
            self.view.loaderPosts(show: self.isLoading)
            switch result {
            case .success(let response):
                if let data = response.data, let posts = data.posts {
                    if posts.isEmpty {
                        self.view.noSeachReultView(show: true)
                    } else {
                        self.view.noSeachReultView(show: false)
                    }
                    self.view.postsRetrivel(posts: posts)
                }
            case .failure(let error):
                break
            }
        }
    }
    
    
}
