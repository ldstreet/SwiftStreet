//
//  MarkdownRenderer.swift
//  App
//
//  Created by Luke Street on 7/9/18.
//

protocol InjectMarkdownRenderer {}
extension InjectMarkdownRenderer {
    var markdownRenderer: MarkdownRenderer {
        return InjectionMap.markdownRenderer()
    }
}

protocol MarkdownRenderer {
    func renderMarkdownToHtml(_ markdown: String) throws -> String
}
