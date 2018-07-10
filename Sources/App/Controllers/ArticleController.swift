//
//  ArticleController.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

import Vapor

struct ArticleController: InjectMarkdownRenderer {
    
    func article(_ req: Request) throws -> Future<View> {
        return try req.parameters.next(Article.self).flatMap { article in
            //let base =
            //let fullURLStr = "\(base)/\(article.markdownFilePath)"
            let publicPath = try req.sharedContainer.make(DirectoryConfig.self).workDir + "Public/"
            let fullPath = "\(publicPath)/\(article.markdownFilePath)"
            let res = try req.streamFile(at: fullPath)
            return res.flatMap { response -> Future<Data> in
                return response.http.body.consumeData(on: req)
                //return try response.content.decode(String.self)
            }.flatMap { data -> Future<String> in
                return .map(on: req) {
                    return String.init(data: data, encoding: .utf8)!
                }
                //return try response.content.decode(String.self)
            }.flatMap { markdown -> Future<View> in
                let html = try self.markdownRenderer.renderMarkdownToHtml(markdown)
                return .map(on: req) {
                    return try Page(
                        name: article.title,
                        body: ArticleView(markdownHTML: html)
                        ).render()
                }
            }
        }
    }
    
    
}
