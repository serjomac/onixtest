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
    func loaderPosts(show: Bool)
    func noSeachReultView(show: Bool)
}

public class PostsViewController: UIViewController {
    
    // MARK: - OULETS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var viewContent: UIView!
    
    
    // MARK: - PROPIEDADES
    var presenter: PostsPresenter!
    var configurator = PostsConfigurator.shared
    private let refreshControl = UIRefreshControl()
    private var noSearchResultView: NoSerchResultView!
    
    
    // MARK: - CICLO DE VIDA
    public override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configurator(with: self)
        configureTableView()
        setupSubViews()
        presenter.viewDidLoad()
    }
    
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 430
        tableView.refreshControl = refreshControl
        tableView.register(PostTableViewCell.getNib(), forCellReuseIdentifier: PostTableViewCell.cellId)
        refreshControl.addTarget(self, action: #selector(pullRefresh(_:)), for: .valueChanged)
    }
    
    func setupSubViews() {
        noSearchResultView = NoSerchResultView(frame: CGRect(x: 0, y: 160, width: self.view.frame.width, height: self.view.frame.height)).loadViewFromNib() as? NoSerchResultView
        noSearchResultView.tag = 100
        noSearchResultView.setupImage(image: .noSearchResult)
    }
    
    func createActivityIndicatorFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = footerView.center
        footerView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        return footerView
    }
    
    @objc private func pullRefresh(_ sender: Any) {
        if presenter.isFiltered {
            presenter.searchPosts(page: 5)
        } else {
            presenter.reloadPosts(page: 5)
        }
    }
    
    @objc func searchPost() {
        self.presenter.previousRun = Date()
        presenter.searchPosts(page: 5)
    }

}

extension PostsViewController: PostsViewProtocol {
    func noSeachReultView(show: Bool) {
        if show {
            DispatchQueue.main.async {
                self.tableView.isHidden = true
                self.viewContent.addSubview(self.noSearchResultView)
            }
        } else {
            DispatchQueue.main.async {
                self.tableView.isHidden = false
                if let viewWithTag = self.viewContent.viewWithTag(100) {
                    viewWithTag.removeFromSuperview()
                }
            }
        }
    }
    
    func loaderPosts(show: Bool) {
        if show {
            tableView.tableFooterView = createActivityIndicatorFooter()
        } else {
            DispatchQueue.main.async { [weak self]in
                self?.refreshControl.endRefreshing()
                self?.tableView.tableFooterView = nil
            }
        }
    }
    
    func postsRetrivel(posts: [ONIXEntites.Post]) {
        if presenter.isFiltered {
            presenter.postsFiltered += posts
        } else {
            presenter.posts += posts
        }
        DispatchQueue.main.async { [weak self] in
            self?.tableView.tableFooterView = nil
            self?.tableView.reloadData()
        }
    }
}

// MARK: - TABLEVIEW DELEGATE
extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.postCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellId, for: indexPath) as? PostTableViewCell, let post = presenter.getPostByIndex(index: indexPath.row) else {
            return PostTableViewCell()
        }
        cell.setupCell(postName: post.data?.title ?? "", postDescription: post.data?.description ?? "", authorName: post.data?.authorFullname ?? "", urlImage: post.data?.urlImage ?? "", commentsCount: (post.data?.commentsCount ?? 0).description, likeCount: (post.data?.score ?? 0).description)
        return cell
    }
    
    // IDENTIFICAR CUANDO LA TABLA LLEGÓ AL FINAL PARA SOLICITAR MÁS POSTS
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.searchBar.resignFirstResponder()
        let position = scrollView.contentOffset.y
        let positionTable = ((self.tableView.contentSize.height+50) - scrollView.frame.size.height)
        if position > positionTable, !presenter.isLoading {
            if presenter.isFiltered {
                presenter.searchPosts(page: 5)
            } else {
                presenter.reloadPosts(page: 5)
            }
        }
    }
}

// MARK: - SEARCH BAR DELEGATE
extension PostsViewController: UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let textToSearch = searchBar.text, !textToSearch.isEmpty else {
            presenter.isFiltered = false
            presenter.query = searchBar.text ?? ""
            presenter.postsFiltered.removeAll()
            presenter.reloadPosts(page: 5)
            return
        }
        presenter.query = textToSearch
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchPost), object: nil)
        self.perform(#selector(searchPost), with: nil, afterDelay: 0.4)
    }
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.isFiltered = false
        presenter.postsFiltered.removeAll()
        presenter.reloadPosts(page: 5)
    }
}
