//
//  HomeController.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

import Vapor

struct HomeController: InjectArticleDatasource {
    
    func home(_ req: Request) throws -> Future<View> {
        let page = try Page(
                name: "Swift Street",
                body: ArticleStream(articles: articleDatasource.fetchArticles().enumerated().map { arg in
                    
                    let (index, article) = arg
                    return ArticleStream.ArticleTile.standard(title: article.title, articleLink: "article/\(index)", imagePath: article.imagePath, date: article.date, previewText: article.description)
                })
        ).render()
        
        return .map(on: req) { return page }
        
    }
    
}
