//
//  Article.swift
//  App
//
//  Created by Luke Street on 1/11/19.
//

import Vapor

struct Article: Codable {
    var title: String
    var description: String
    var date: Date
    var imagePath: String
    var author: String
    var playgroundFilePath: String
}

enum ArticleError: Error {
    case invalidID
}

extension Article: Vapor.Content {}
extension Article: Parameter {
    static func resolveParameter(_ parameter: String, on container: Container) throws -> Future<Article> {
        let articles = try Current.fetchArticles()
        guard let id = Int(parameter), id < articles.count else {
            throw ArticleError.invalidID
        }
        return .map(on: container) { return articles[id] }
    }
}
