//
//  ArticleController.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

import Vapor

struct ArticleController {
    
    func article(_ req: Request) throws -> Future<View> {
        return try req.parameters.next(Article.self).flatMap { article in
            .map(on: req) {
                return try Page(
                    name: article.title,
                    body: Social.SocialLink.github
                ).render()
            }
        }
    }
    
    
}
