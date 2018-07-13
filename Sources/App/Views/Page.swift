//
//  Page.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct Page: Renderable, HTMLed {
    
    var name: String
    var currentItem: Nav.Items
    var body: Body
    var hasExtra: Bool
    
    init(name: String, body: Body, hasExtra: Bool = true, currentItem: Nav.Items) {
        self.name = name
        self.body = body
        self.hasExtra = hasExtra
        self.currentItem = currentItem
    }
    
    
    var html: String {
        return """
        <!DOCTYPE html>
        <html class="no-js" lang="en">
        \(Head(pageName: name))
        <body id="top">
        \(PageHeader(currentItem: currentItem))
        \(body)
        \(hasExtra ? Extra().html : "")
        \(Footer())
        \(Foot())
        </body>
        </html>
        """
    }
    
}
