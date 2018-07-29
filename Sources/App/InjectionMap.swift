//
//  InjectionMap.swift
//  App
//
//  Created by Luke Street on 7/9/18.
//

import PerfectMarkdown

struct SwiftMarkdownRenderer: MarkdownRenderer {
    func renderMarkdownToHtml(_ markdown: String) throws -> String {
        return markdown.markdownToHTML ?? ""
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
