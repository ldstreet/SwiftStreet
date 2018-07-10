//
//  ArticleDatasource.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

import Vapor

struct Article: Codable {
    
    var title: String
    var description: String
    var date: Date
    var imagePath: String
    var author: String
    var markdownFilePath: String
}

enum ArticleError: Error {
    case invalidID
}

extension Article: Content {}
extension Article: Parameter {
    static func resolveParameter(_ parameter: String, on container: Container) throws -> Future<Article> {
        let articles = try InjectionMap.articleDatasource().fetchArticles()
        guard let id = Int(parameter), id < articles.count else {
            throw ArticleError.invalidID
        }
        return .map(on: container) { return articles[id] }
    }
}



protocol InjectArticleDatasource {}
extension InjectArticleDatasource {
     var articleDatasource: ArticleDatasource { return InjectionMap.articleDatasource() }
}

protocol ArticleDatasource {
    func fetchArticles() throws -> [Article]
}

struct ProgramaticArticleDatasource: ArticleDatasource {
    func fetchArticles() throws -> [Article] {
        return [
            Article(
                title: "My First Blog Post",
                description: "This is a post about...nothing yet!",
                date: .init(),
                imagePath: "",
                author: "Luke Street",
                markdownFilePath: "posts/Generics.md"
            ),
            Article(
                title: "My Second Blog Post",
                description: "This is a post about...nothing yet!",
                date: .init(),
                imagePath: "",
                author: "Luke Street",
                markdownFilePath: "posts/Generics.md"
            ),
            Article(
                title: "My Third Blog Post",
                description: "This is a post about...nothing yet!",
                date: .init(),
                imagePath: "",
                author: "Luke Street",
                markdownFilePath: "posts/Generics.md"
            )
        ]
    }
    
    
}
