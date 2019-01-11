//
//  InjectionMap.swift
//  App
//
//  Created by Luke Street on 7/9/18.
//

//import PerfectMarkdown
import PlayDocsKit

struct SwiftMarkdownRenderer {
    func renderMarkdownToHtml(_ markdown: String) throws -> String {
        return try convertToHTML(from: markdown)
    }
}
