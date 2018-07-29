//
//  ArticleView.swift
//  App
//
//  Created by Luke Street on 7/9/18.
//

struct ArticleView: Renderable, HTMLed {
    
    var markdownHTML: String
    
    var html: String {
        let newTag = """
                    <code class="language-swift">
                    """
        let markdown = markdownHTML
            .replacingOccurrences(of: "<code>", with: newTag)
        return """
        <article class="row format-standard">
        <script src="/js/prism.js"></script>
        \(markdown)
        </article>
        """
    }
}
