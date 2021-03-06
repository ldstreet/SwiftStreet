//
//  Page.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct Page: Renderable, HTMLed {
    
    var name: String
    var body: Renderable & HTMLed
    
    var html: String {
        return """
        <!DOCTYPE html>
        <html class="no-js" lang="en">
        \(Head(pageName: name))
        <body id="top">
        \(PageHeader())
        \(body)
        \(Extra())
        \(Footer())
        \(Foot())
        </body>
        </html>
        """
    }
    
}
