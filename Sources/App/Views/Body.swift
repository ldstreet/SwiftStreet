//
//  Content.swift
//  App
//
//  Created by Luke Street on 7/11/18.
//

struct Body: Renderable, HTMLed {
    
    var content: Renderable & HTMLed
    
    var html: String {
        return """
        <!-- s-content
        ================================================== -->
        <section class="s-content">
        \(content)
        </section> <!-- s-content -->
        """
    }
}
