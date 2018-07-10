//
//  ArticleView.swift
//  App
//
//  Created by Luke Street on 7/9/18.
//

struct ArticleView: Renderable, HTMLed {
    
    var markdownHTML: String
    
    var html: String {
        return """
        <div>
        \(markdownHTML)
        </div>
        """
    }
}
