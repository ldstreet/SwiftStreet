//
//  PageHeader.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct PageHeader: Renderable, HTMLed {
    
    var html: String {
        return """
        <!-- pageheader
        ================================================== -->
        <section class="s-pageheader s-pageheader--home">
        \(Header())
        </section> <!-- end s-pageheader -->
        """
    }
    
}
