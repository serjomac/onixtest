//
//  Post.swift
//  ONIXEntites
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation

public struct PostResponse: Codable {
    public let kind: String?
    public let data: Data?
}

// MARK: - PostData
public struct Data: Codable {
    public let after: String?
    public let dist: Int?
    public let modhash, geoFilter: String?
    public let posts: [Post]?

    enum CodingKeys: String, CodingKey {
        case after, dist, modhash
        case geoFilter = "geo_filter"
        case posts = "children"
    }
}

// MARK: - Child
public struct Post: Codable {
    public let kind: String?
    public let data: PostData?
}

// MARK: - ChildData
public struct PostData: Codable {
    public let subreddit, description, authorFullname: String?
    public let saved: Bool?
    public let title: String?
    public let hidden: Bool?
    public let urlImage: String
    public let commentsCount: Int?

    enum CodingKeys: String, CodingKey {
        case subreddit
        case description = "selftext"
        case authorFullname = "author_fullname"
        case saved, title, hidden
        case urlImage = "url"
        case commentsCount = "num_comments"
    }
}
