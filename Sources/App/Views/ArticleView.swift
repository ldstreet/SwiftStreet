//
//  ArticleView.swift
//  App
//
//  Created by Luke Street on 7/9/18.
//

struct ArticleView: Renderable, HTMLed {
    
    var markdownHTML: String
    
    var html: String {
//        let newTag = """
//                    <code class="language-swift">
//                    """
        let markdown = markdownHTML
            //.replacingOccurrences(of: "<code>", with: newTag)
        return """
        <article class="row format-standard">
        \(markdown)
        </article>
        """
    }
}
//
//struct ArticleView: Renderable, HTMLed {
//    
//    var markdownHTML: String
//    
//    var html: String {
//        let markdown = markdownHTML
//        
//        let markdownNode = Node.raw(markdown)
//        
//        let document = article(
//            [Attribute.init("class", "row")],
//            [
//                markdownNode
//            ])
//        return Html.render(document)
//    }
//}
