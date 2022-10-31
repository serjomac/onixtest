//
//  PostsViewController.swift
//  ONIXPosts
//
//  Created by Jonathan Macías on 30/10/22.
//

import UIKit
import ONIXUIKit
import ONIXEntites

protocol PostsViewProtocol: AnyObject {
    func postsRetrivel(posts: [Post])
}

public class PostsViewController: UIViewController {
    
    // MARK: - OULETS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPIEDADES
    var presenter: PostsPresenter!
    var configurator = PostsConfigurator.shared
    
    
    // MARK: - CICLO DE VIDA
    public override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configurator(with: self)
        configureTableView()
        presenter.viewDidLoad()
    }
    
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(PostTableViewCell.getNib(), forCellReuseIdentifier: PostTableViewCell.cellId)
    }
    

}

extension PostsViewController: PostsViewProtocol {
    func postsRetrivel(posts: [ONIXEntites.Post]) {
        presenter.posts = posts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.postCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellId, for: indexPath) as? PostTableViewCell, let post = presenter.getPostByIndex(index: indexPath.row) else {
            return PostTableViewCell()
        }
        cell.setupCell(postName: post.data?.title ?? "", postDescription: post.data?.description ?? "", authorName: post.data?.authorFullname ?? "", urlImage: post.data?.urlImage ?? "", commentsCount: (post.data?.commentsCount ?? 0).description)
        return cell
    }
    
    
}
