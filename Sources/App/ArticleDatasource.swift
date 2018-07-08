//
//  ArticleDatasource.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

import Foundation

struct Article {
    
    var title: String
    var description: String
    var date: Date
    var imagePath: String
    var author: String
    var markdownFilePath: String
}

struct InjectionMap {
    static var articleDatasource: () -> ArticleDatasource = {
        return ProgramaticArticleDatasource()
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
                markdownFilePath: ""
            )
        ]
    }
    
    
}
