//
//  ArticleDatasource.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

import Foundation

struct ProgramaticArticleDatasource {
    func fetchArticles() throws -> [Article] {
        return [
            Article(
                title: "Generics",
                description: "In this post we deep dive into generics. How they work, where they work, and how you can use them in your own codebase.",
                date: Date.dateFrom_MMddyyyy("09/10/2018") ?? Date.init(),
                imagePath: "",
                author: "Luke Street",
                playgroundFilePath: "posts/Generics.playground"
            ),
            
        ]
    }
}
