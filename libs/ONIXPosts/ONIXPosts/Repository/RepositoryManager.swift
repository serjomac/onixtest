//
//  RepositoryManager.swift
//  ONIXPosts
//
//  Created by Jonathan Macías on 31/10/22.
//

import Foundation

public enum Enviroment {
    case dev
    case prod
    case mock
    
    public var baseUrl: String {
        switch self {
        case .dev:
            return "https://www.reddit.com/r/chile/new/.json"
        case .mock:
            return "https://www.reddit.com/r/chile/new/.json"
        case .prod:
            return "https://www.reddit.com/r/chile/new/.json"
        }
    }
    
    public var searchUrl: String {
        switch self {
        case .dev:
            return "https://www.reddit.com/r/chile/search.json"
        case .mock:
            return "https://www.reddit.com/r/chile/search.json"
        case .prod:
            return "https://www.reddit.com/r/chile/search.json"
        }
    }
}

class ONIXRequestManager {
    public static let shared = ONIXRequestManager()
    
    public static let currentEnviroment: Enviroment = .dev
    
}

