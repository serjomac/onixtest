//
//  PostsInteractor.swift
//  ONIXPosts
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import ONIXEntites

protocol PostsInteractorProtocol {
    func fetchPosts(page: Int, completion: @escaping (Result<PostResponse, Error>) -> Void)
}

class PostsInteractor: PostsInteractorProtocol {
    func fetchPosts(page: Int, completion: @escaping (Result<PostResponse, Error>) -> Void) {
            guard let url = URL(string: "https://www.reddit.com/r/chile/new/.json?limit=\(page)") else { return }
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    completion(.failure(error!))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(PostResponse.self, from: data)
                        completion(.success(data))
                } catch let error {
                    completion(.failure(error))
                    
                }
            }.resume()
        }
}
