//
//  InjectionMap.swift
//  App
//
//  Created by Luke Street on 7/9/18.
//

import SwiftMarkdown

struct SwiftMarkdownRenderer: MarkdownRenderer {
    func renderMarkdownToHtml(_ markdown: String) throws -> String {
        return try markdownToHTML(markdown)
    }
}

struct InjectionMap {
    static var articleDatasource: () -> ArticleDatasource = {
        return ProgramaticArticleDatasource()
    }
    
    static var markdownRenderer: () -> MarkdownRenderer = {
        return SwiftMarkdownRenderer()
    }
}
