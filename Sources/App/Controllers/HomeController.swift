//
//  HomeController.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

import Vapor

struct HomeController {
    
    func home(_ req: Request) throws -> Future<View> {
        let stream = try ArticleStream(articles: Current.fetchArticles().enumerated().map { arg in
            
            let (index, article) = arg
            return ArticleStream.ArticleTile.standard(
                title: article.title,
                articleLink: "article/\(index)",
                imagePath: article.imagePath,
                date: article.date,
                previewText: article.description
            )
        })
        
        let page = try Page(
                name: "Swift Street",
                body: Body(content: stream),
                currentItem: .home
        ).render()
        
        return .map(on: req) { return page }
        
    }
    
}
