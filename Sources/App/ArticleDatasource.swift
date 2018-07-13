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

extension Article: Vapor.Content {}
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
                title: "Generics",
                description: "In this post we deep dive into generics. How they work, where they work, and how you can use them in your own codebade.",
                date: Date.dateFrom_MMddyyyy("09/10/2018") ?? Date.init(),
                imagePath: "",
                author: "Luke Street",
                markdownFilePath: "posts/Generics.md"
            )
        ]
    }
    
    
}
