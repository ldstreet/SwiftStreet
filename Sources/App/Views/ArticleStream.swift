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
        <!-- s-content
        ================================================== -->
        <section class="s-content">
        
        <div class="row masonry-wrap">
        <div class="masonry">
        
        <div class="grid-sizer"></div>
        
        \(
        articles.reduce("") { result, article in
            return """
            \(result)
            \(article)
            """
        }
        )
        
        </div> <!-- end masonry -->
        </div> <!-- end masonry-wrap -->
        
        <div class="row">
        <div class="col-full">
        <nav class="pgn">
        <ul>
        <li><a class="pgn__prev" href="#0">Prev</a></li>
        <li><a class="pgn__num" href="#0">1</a></li>
        <li><span class="pgn__num current">2</span></li>
        <li><a class="pgn__num" href="#0">3</a></li>
        <li><a class="pgn__num" href="#0">4</a></li>
        <li><a class="pgn__num" href="#0">5</a></li>
        <li><span class="pgn__num dots">…</span></li>
        <li><a class="pgn__num" href="#0">8</a></li>
        <li><a class="pgn__next" href="#0">Next</a></li>
        </ul>
        </nav>
        </div>
        </div>
        
        </section> <!-- s-content -->
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
