//
//  ArticleStream.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

import Foundation

struct ArticleStream: Renderable, HTMLed {
    
    var articles: [ArticleTile]
    
    var html: String {
        return """
        <div class="row masonry-wrap">
        <div class="masonry">
        
        <div class="grid-sizer"></div>
        
        \(
        articles
        )
        
        </div> <!-- end masonry -->
        </div> <!-- end masonry-wrap -->
        """
    }
    
    enum ArticleTile: Renderable, HTMLed {
        
        case standard(title: String, articleLink: String, imagePath: String, date: Date, previewText: String)
        
        var html: String {
            switch self {
                
            case .standard(let title, let articleLink, let imagePath, let date, let previewText):
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .full
                let dateStr = dateFormatter.string(from: date)
                
                return """
                <article class="masonry__brick entry format-standard" data-aos="fade-up">
                
                <div class="entry__thumb">
                <a href="\(articleLink)" class="entry__thumb-link">
                <img src="\(imagePath)">
                </a>
                </div>
                
                <div class="entry__text">
                <div class="entry__header">
                
                <div class="entry__date">
                <a href="\(articleLink)">\(dateStr)</a>
                </div>
                <h1 class="entry__title"><a href="\(articleLink)">\(title)</a></h1>
                
                </div>
                <div class="entry__excerpt">
                <p>
                \(previewText)
                </p>
                </div>
                </div>
                
                </article> <!-- end article -->
                """
            }
            
        }
    }
}
